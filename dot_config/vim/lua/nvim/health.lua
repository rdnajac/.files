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

  for _, cmd in ipairs({
    'cowsay',
    'fortune',
    'nnn',
    'pokeget',
    'quarto',
    'Rscript',
    'tmux',
    'tree-sitter',
  }) do
    ensure_installed(cmd)
  end

  local nvim_ver = vim.version()
  local major, minor = nvim_ver.major, nvim_ver.minor
  if major > 0 or minor >= 12 then
    ok('Using Neovim >= 0.12.0')
  elseif minor == 11 then
    warn('Using Neovim 0.11.0 — recommended 0.12.0 or higher')
  else
    error('Neovim >= 0.11.0 is required')
  end
end

return M
