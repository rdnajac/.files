-- config/nvim/lua/util/init.lua
require('util.munchies')
vim.api.nvim_create_user_command('NNN', "lua require('util.nnn').start()", {})
vim.api.nvim_create_user_command('Rename', "lua require('snacks').rename.rename_file()", {})

function ToScratch(text, opts)
  opts = opts or {}
  -- opts.name = opts.name or cmd
  opts.template = table.concat(text, '\n')
  return Snacks.scratch(opts)
end

local function redir_vim_command(cmd)
  vim.cmd('redir => g:output')
  vim.cmd('silent ' .. cmd)
  vim.cmd('redir END')
  local output = vim.fn.split(vim.g.output, '\n')
  ToScratch(output, {})
end

local function redir(args)
  local cmd = args.args
  redir_vim_command(cmd)
end

vim.api.nvim_create_user_command("Redir", redir, {
  nargs = "+",
  complete = "command",
  range = true,
  bang = true,
})
vim.cmd([[cabbrev R Redir]])

  -- local stderr_p = args.bang

  -- if vim.g.DEBUG then log.info(vim.inspect(args)) end

--   if cmd:sub(1, 1) == "!" then
--     local range = args.range
--     local lines
--     if range == 0 then
--       lines = {}
--     else
--       local line1 = args.line1 - 1
--       local line2 = args.line2
--       line2 = line1 == line2 and line1 + 1 or line2
--       lines = vim.api.nvim_buf_get_lines(0, line1, line2, false)
--     end
--
--     cmd = cmd:sub(2)
--     -- redir_shell_command(cmd, lines, vertical, stderr_p)
--   else
--     redir_vim_command(cmd)
--   end
-- end
--
