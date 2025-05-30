return {
  'dense-analysis/ale',
  'tpope/vim-abolish',
  'tpope/vim-apathy',
  'tpope/vim-fugitive',
  'tpope/vim-repeat',
  -- 'tpope/vim-scriptease',
  'tpope/vim-surround',
  'tpope/vim-tbone',
  'tpope/vim-unimpaired',
  'lervag/vimtex',
  -- 'vuciv/golf',
  {
    'stevearc/oil.nvim',
    lazy = false,
    config = function()
      require('nvim.oil')
    end,
  },
  {
    'monaqa/dial.nvim',
    event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
    config = function()
      require('nvim.dial')
    end,
  },
  {
    'junegunn/fzf.vim',
    init = function()
      -- local fzf_path = vim.fn.expand('~/GitHub/rdnajac/src/fzf')
      -- vim.opt.runtimepath:prepend(fzf_path)
      vim.cmd([[source ~/GitHub/rdnajac/src/fzf/plugin/fzf.vim]])
    end,
  },
}
