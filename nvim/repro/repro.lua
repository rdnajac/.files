-- For reproducing an issue, use the template below.
vim.env.LAZY_STDPATH = '~/repro'
load(vim.fn.system('curl -s https://raw.githubusercontent.com/folke/lazy.nvim/main/bootstrap.lua'))()

---@diagnostic disable: missing-fields
require('lazy.minit').repro({
  spec = {
    { 'LazyVim/LazyVim', import = 'lazyvim.plugins' },
    -- add any other plugins here
    {
      'Dronakurl/injectme.nvim',
      dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope.nvim',
      },
      -- This is for lazy load and more performance on startup only
      cmd = { 'InjectmeToggle', 'InjectmeSave', 'InjectmeInfo', 'InjectmeLeave' },
    },
  },
})

vim.cmd([[
cmap ?? verbose set?<left><space>
]])

require('nvim-treesitter.parsers').get_parser_configs().inlinestirng = {
  install_info = {
    url = '~/Desktop/GitHub/rdnajac/tree-sitter-inlinestring',
    files = { 'src/parser.c' },
  },
}
