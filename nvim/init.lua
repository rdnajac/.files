vim.cmd("source ~/.vim/vimrc")

require 'autocmds'
require 'colors'

-- https://lsp-zero.netlify.app/docs/tutorial.html#complete-code
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
local uv = vim.uv or vim.loop

-- Auto-install lazy.nvim if not present
if not uv.fs_stat(lazypath) then
  print('Installing lazy.nvim....')
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
  print('Done.')
end

vim.opt.rtp:prepend(lazypath)

  require("lazy").setup({
    ui = { border = "rounded", },
    change_detection = { enabled = true, notify = false, },
    install = { colorscheme = { "tokyonight-night" } },
    spec = {
      {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
          vim.cmd([[colorscheme tokyonight-night]])
        end,
      },
      { import = "plugins" },
    },
  })


