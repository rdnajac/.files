local M = {}

---@type snacks.picker.Config
M.opts = {
  picker = {
    layouts = {
      vscode = {
        layout = {
          backdrop = false,
          row = 1,
          width = 0.4,
          min_width = 80,
          height = 0.4,
          -- border = 'rounded',
          box = 'vertical',
          {
            win = 'input',
            height = 1,
            -- border = 'rounded',
            title = '{title} {live} {flags}',
            title_pos = 'center',
          },
          { win = 'list', border = 'none' },
        },
      },
    },
    win = { preview = { minimal = true } },
    sources = {
      -- command_history = { layout = { preset = 'vscode' }, confirm = 'cmd' },
      autocmds = { layout = { preset = 'ivy_split' }, confirm = 'edit' },
      buffers = { layout = { preset = 'vscode' } },
      commands = { layout = { preset = 'ivy' } },
      explorer = {
        git_untracked = false,
        win = {
          list = {
            keys = {
              ['-'] = 'explorer_up',
              -- ['l'] = 'confirm',
              -- ['h'] = 'explorer_close',
              ['<Right>'] = 'confirm',
              ['<Left>'] = 'explorer_close',
              ['c'] = 'explorer_copy',
              ['m'] = 'explorer_move',
              ['r'] = 'explorer_rename',
              -- ['o'] = 'explorer_open',
              ['P'] = 'toggle_preview',
              ['y'] = { 'explorer_yank', mode = { 'n', 'x' } },
              ['p'] = 'explorer_paste',
              ['u'] = 'explorer_update',
            },
          },
        },
      },
      files = { layout = { preset = 'sidebar' } },
      grep = { layout = { preset = 'ivy' }, follow = true, ignored = true },
      help = { layout = { preset = 'vscode' } },
      keymaps = { layout = { preset = 'ivy_split' }, confirm = 'edit' },
      notifications = { layout = { preset = 'ivy_split' }, confirm = 'edit' },
      pickers = { layout = { preset = 'vscode' } },
      zoxide = {
        layout = { preset = 'vscode' },
        confirm = { 'edit' },
        --      confirm = function(self, item)
        --        local dir = item.path or item.filename or item.value or item.text
        --        if type(dir) ~= 'string' or dir == '' then
        --          vim.notify('No valid directory found', vim.log.levels.WARN)
        --          return
        --        end
        --        local win = vim.api.nvim_get_current_win()
        --
        --        vim.cmd('leftabove vsplit ' .. vim.fn.fnameescape(dir))
        --        vim.cmd('vertical resize ' .. math.floor(vim.o.columns * 0.2))
        --        vim.cmd('cd ' .. vim.fn.fnameescape(dir))
        -- vim.cmd('pwd')
        --        vim.api.nvim_set_current_win(win)
        --      end,
      },
    },
  },
}

local scriptnames = function()
  local ok, result = pcall(vim.api.nvim_exec2, 'scriptnames', { output = true })
  if not ok then
    return {}
  end

  local items = {}
  for _, line in ipairs(vim.split(result.output, '\n', { plain = true, trimempty = true })) do
    local idx, path = line:match('^%s*(%d+):%s+(.*)$')
    if idx and path then
      table.insert(items, {
        formatted = path,
        text = string.format('%3d %s', idx, path),
        file = path,
        item = path,
        idx = tonumber(idx),
      })
    end
  end

  return items
end

M.scriptnames = function()
  Snacks.picker.pick({
    title = 'Scriptnames',
    items = scriptnames(),
    format = function(item)
      return { { item.text } }
    end,
    -- format = 'file',
    preview = 'file',
  })
end

-- https://learnvimscriptthehardway.stevelosh.com
M.hardway = {
  finder = 'grep',
  hidden = true,
  ignored = true,
  follow = false,
  cwd = vim.fn.expand('$XDG_CONFIG_HOME/vim/docs/learnvimscriptthehardway'),
  confirm = function(picker, item)
    picker:close()
    vim.cmd('!open ' .. Snacks.picker.util.path(item))
  end,
}

return M
