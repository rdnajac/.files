vim.g.rout_follow_colorscheme = true

-- Register which-key group labels (for UI only)
require('which-key').add({
  { '<localleader>r', group = 'R', icon = { icon = ' ', color = 'blue' } },
  { '<localleader>re', group = 'renv' },
})

---@type RConfigUserOpts
local opts = {
  R_args = { '--quiet', '--no-save' },
  pdfviewer = '',
  user_maps_only = true,
  hook = {
    on_filetype = function()
      print('R.nvim filetype hook triggered!')
      vim.cmd([[
        setlocal keywordprg=:RHelp

        nnoremap <buffer> ,, <Plug>RStart
        nnoremap <buffer> ]r <Plug>NextRChunk
        nnoremap <buffer> [r <Plug>PreviousRChunk
        vnoremap <buffer> <CR> <Plug>RSendSelection
        nnoremap <buffer> <CR> <Plug>RDSendLine
        nnoremap <buffer> <M-CR> <Plug>RInsertLineOutput

        nnoremap <buffer> <localleader>r<CR> <Plug>RSendFile
        nnoremap <buffer> <localleader>rq <Plug>RClose
        nnoremap <buffer> <localleader>rD <Plug>RSetwd

        nnoremap <buffer> <localleader>r? :RSend getwd()<CR>
        nnoremap <buffer> <localleader>rR :RSend source(".Rprofile")<CR>
        nnoremap <buffer> <localleader>rd :RSend setwd(vim.fn.expand("<cword>"))<CR>

        nnoremap <buffer> <localleader>re? :RSend renv::status()<CR>
        nnoremap <buffer> <localleader>res :RSend renv::snapshot()<CR>
        nnoremap <buffer> <localleader>rer :RSend renv::restore()<CR>
      ]])

      -- Quarto preview with dynamic file path from Lua
      vim.keymap.set('n', '<localleader>rq', function()
        local file = vim.fn.expand('%:p')
        vim.cmd('RSend quarto::quarto_preview(file="' .. file .. '")')
      end, { buffer = true, desc = 'Quarto Preview' })
    end,
    after_config = function()
      vim.cmd([[
       hi clear RCodeBlock 
       hi clear RCodeComment
       ]])
    end,
  },
}

require('r').setup(opts)

require('r.pdf.generic').open = vim.ui.open

-- If R is remote, extend the options table with remote-specific settings
-- To configure a remote R session, run `nvim --cmd "let g:R_is_remote = 1"`
-- if vim.g.R_is_remote then
--   opts = vim.tbl_extend('force', opts, {
--     R_app = '/Users/rdn/.local/bin/sshR',
--     R_cmd = '/Users/rdn/.local/bin/sshR',
--     compldir = '/Users/rdn/.remoteR',
--     remote_compldir = '/home/ubuntu/.cache/R.nvim',
--     local_R_library_dir = '/Users/rdn/.local/share/nvim/lazy/R.nvim',
--   })
