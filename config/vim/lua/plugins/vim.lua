return {
  { 'tpope/vim-abolish' },
  { 'tpope/vim-apathy' },
  { 'tpope/vim-eunuch' },
  {
    'tpope/vim-tbone',
    init = function()
      vim.cmd([[
        nmap <localleader>t0 <Cmd>Twrite0<CR>
        nmap <localleader>t1 <Cmd>Twrite1<CR>
        nmap <localleader>t2 <Cmd>Twrite2<CR>
        nmap <localleader>t3 <Cmd>Twrite3<CR>
      ]])
    end,
  },
  {
    'christoomey/vim-tmux-navigator',
    keys = {
      { '<C-h>', '<Cmd>TmuxNavigateLeft<Cr>' },
      { '<C-j>', '<Cmd>TmuxNavigateDown<Cr>' },
      { '<C-k>', '<Cmd>TmuxNavigateUp<Cr>' },
      { '<C-l>', '<Cmd>TmuxNavigateRight<Cr>' },
    },
  },
  -- { 'LukeGoodsell/nextflow-vim' },
}
