local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim/'

if not vim.uv.fs_stat(lazypath) then
  load(vim.fn.system('curl -s https://raw.githubusercontent.com/folke/lazy.nvim/main/bootstrap.lua'))()
else
  vim.opt.rtp:prepend(lazypath)
end

-- Don't load LazyVim options
package.loaded["lazyvim.config.options"] = true

-- Quiet error on startup
vim.g.lazyvim_check_order = false
-- LazyVim auto format
vim.g.autoformat = true

-- Snacks animations
-- Set to `false` to globally disable all snacks animations
vim.g.snacks_animate = true

-- LazyVim picker to use.
-- Can be one of: telescope, fzf
-- Leave it to "auto" to automatically use the picker
-- enabled with `:LazyExtras`
vim.g.lazyvim_picker = "auto"

-- LazyVim completion engine to use.
-- Can be one of: nvim-cmp, blink.cmp
-- Leave it to "auto" to automatically use the completion engine
-- enabled with `:LazyExtras`
vim.g.lazyvim_cmp = "auto"

-- if the completion engine supports the AI source,
-- use that instead of inline suggestions
vim.g.ai_cmp = true

-- LazyVim root dir detection
-- Each entry can be:
-- * the name of a detector function like `lsp` or `cwd`
-- * a pattern or array of patterns like `.git` or `lua`.
-- * a function with signature `function(buf) -> string|string[]`
vim.g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }

-- Optionally setup the terminal to use
-- This sets `vim.o.shell` and does some additional configuration for:
-- * pwsh
-- * powershell
-- LazyVim.terminal.setup("pwsh")

-- Set LSP servers to be ignored when used with `util.root.detectors.lsp`
-- for detecting the LSP root
vim.g.root_lsp_ignore = { "copilot" }

-- Hide deprecation warnings
vim.g.deprecation_warnings = false

require('lazy').setup({
  spec = {
    {
      'LazyVim/LazyVim',
      -- import = 'lazyvim.plugins',
      keys = {
        { '<leader>l', '<cmd>Lazy<CR>', desc = 'Lazy' },
        { '<leader>L', '<cmd>LazyExtras<CR>', desc = 'LazyExtras' },
      },
    },
    { import = 'lazy.spec' },
  },
  lockfile = vim.fn.stdpath('config') .. '/.lazy-lock.json',
  install = { colorscheme = { 'tokyonight' } },
  ui = {
    border = 'rounded',
    custom_keys = {
      ['<localleader>d'] = {
        function(plugin)
          dd(plugin)
        end,
        desc = 'Debug Plugin',
      },
    },
  },
  rocks = { enabled = false },
  change_detection = {
    enabled = true,
    notify = false,
  },
  performance = {
    reset_packpath = false,
    rtp = {
      reset = false,
      disabled_plugins = {
        'gzip',
        -- 'matchit',
        -- 'matchparen',
        -- 'netrwPlugin',
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
      },
    },
  },
  profiling = {
    loader = false,
    require = false,
  },
})
