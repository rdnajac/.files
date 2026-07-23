-- in-process LSP: chezmoi code actions/hover for buffers under `chezmoi source-path`
local M = {}

local capabilities = {
  codeActionProvider = true,
  executeCommandProvider = { commands = { 'apply', 'diff' } },
  hoverProvider = true,
}

---@type table<string, function>
local methods = {
  initialize = function(_, callback)
    return callback(nil, { capabilities = capabilities })
  end,
  shutdown = function(_, callback)
    return callback(nil, nil)
  end,
}

local function chezmoi(args, path, on_exit)
  vim.system(
    vim.list_extend({ 'chezmoi' }, vim.list_extend(args, { path })),
    { text = true },
    vim.schedule_wrap(on_exit)
  )
end

---@param params { textDocument: { uri: string }, range: table, context: { only: table? } }
---@param callback function
methods['textDocument/codeAction'] = function(params, callback)
  local empty_kind = vim.lsp.protocol.CodeActionKind.Empty
  local only = params.context.only or { empty_kind }
  if not vim.tbl_contains(only, empty_kind) then
    return callback(nil, {})
  end

  local path = vim.uri_to_fname(params.textDocument.uri)

  local function new_action(title, command)
    return {
      title = ('%s `%s`'):format(title, vim.fs.basename(path)),
      command = { title = title, command = command, arguments = { path } },
    }
  end

  callback(nil, { new_action('Apply', 'apply'), new_action('Diff', 'diff') })
end

local commands = {
  apply = function(path)
    chezmoi({ 'apply', '-v' }, path, function(out)
      if out.code == 0 then
        vim.notify('chezmoi apply: ' .. vim.fs.basename(path))
      else
        vim.notify('chezmoi apply failed: ' .. out.stderr, vim.log.levels.ERROR)
      end
    end)
  end,
  diff = function(path)
    chezmoi({ 'diff' }, path, function(out)
      if out.stdout == '' then
        vim.notify('chezmoi diff: no changes for ' .. vim.fs.basename(path))
        return
      end
      vim.cmd.vnew()
      vim.bo.filetype, vim.bo.buftype, vim.bo.bufhidden = 'diff', 'nofile', 'wipe'
      vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(out.stdout, '\n'))
    end)
  end,
}

---@param params { command: string, arguments: table }
---@param callback function
methods['workspace/executeCommand'] = vim.schedule_wrap(function(params, callback)
  local path = unpack(params.arguments)
  local ok, err = pcall(commands[params.command], path)
  if not ok then
    return callback({ code = 1, message = err }, {})
  end
  callback(nil, {})
end)

---@param params { textDocument: { uri: string } }
---@param callback function
methods['textDocument/hover'] = function(params, callback)
  local path = vim.uri_to_fname(params.textDocument.uri)
  chezmoi({ 'diff' }, path, function(out)
    if out.stdout == '' then
      return callback(nil, nil)
    end
    local markdown = ('```diff\n%s\n```'):format(out.stdout)
    callback(nil, { contents = { kind = vim.lsp.protocol.MarkupKind.Markdown, value = markdown } })
  end)
end

--- @return vim.lsp.rpc.Client
local function cmd(dispatchers)
  local closing = false
  local request_id = 0
  local server = { ---@type vim.lsp.rpc.Client
    is_closing = function()
      return closing
    end,
    terminate = function()
      closing = true
    end,
    notify = function(method, _)
      if method == 'exit' then
        dispatchers.on_exit(0, 15)
      end
    end,
    request = function(method, params, callback)
      local method_impl = methods[method]
      if method_impl then
        method_impl(params, callback)
      end
      request_id = request_id + 1
      return true, request_id
    end,
  }
  return server
end

local source_path --- @type string|false|nil

--- resolve `chezmoi source-path` once, async, cached for the session
---@param callback fun(root: string?)
local function with_source_path(callback)
  if source_path ~= nil then
    return callback(source_path or nil)
  end
  vim.system({ 'chezmoi', 'source-path' }, { text = true }, function(out)
    source_path = (out.code == 0) and vim.trim(out.stdout) or false
    vim.schedule(function()
      callback(source_path or nil)
    end)
  end)
end

---@param bufnr integer
---@param on_dir fun(root: string)
local function root_dir(bufnr, on_dir)
  local name = vim.api.nvim_buf_get_name(bufnr)
  if name == '' then
    return
  end
  with_source_path(function(root)
    if not root then
      return
    end
    name = vim.fs.normalize(name)
    if name == root or vim.startswith(name, root .. '/') then
      on_dir(root)
    end
  end)
end

return {
  cmd = cmd,
  root_dir = root_dir,
}
