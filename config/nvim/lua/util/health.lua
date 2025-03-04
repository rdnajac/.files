local M = {}

local start = vim.health.start
local ok = vim.health.ok
local warn = vim.health.warn
local error = vim.health.error

local function ensure_installed(cmd)
  if vim.fn.executable(cmd) == 1 then
    ok(('`%s` is installed'):format(cmd))
  else
    warn(('`%s` is not installed'):format(cmd))
  end
end

function M.check()
  start('My health checks')

  for _, cmd in ipairs({ 'tmux', 'nnn', 'pokeget', 'quatro' }) do
    ensure_installed(cmd)
  end

  if vim.fn.has('nvim-0.11.0') == 1 then
    ok('Using Neovim >= 0.11.0')
  else
    error('Neovim >= 0.11.0 is required')
  end
end

return M
