return {
  'github/copilot.vim',
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
 
  -- neovim
  'max397574/better-escape.nvim',
  'monaqa/dial.nvim',
  'MeanderingProgrammer/render-markdown.nvim',
  'stevearc/oil.nvim',
  'R-nvim/R.nvim',
  -- { 'j-hui/fidget.nvim', opts = {}, },
  {
    'junegunn/fzf.vim',
    init = function()
      -- local fzf_path = vim.fn.expand('~/GitHub/rdnajac/src/fzf')
      -- vim.opt.runtimepath:prepend(fzf_path)
      vim.cmd([[source ~/GitHub/rdnajac/src/fzf/plugin/fzf.vim]])
    end,
  },
}
