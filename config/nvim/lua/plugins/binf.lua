return {
  { 'LukeGoodsell/nextflow-vim' },
  {
    'R-nvim/R.nvim',
    init = function()
      vim.g.rout_follow_colorscheme = true
    end,
    opts = function()
      local opts = {
        R_args = { '--quiet', '--no-save' },
        pdfviewer = '',
        user_maps_only = true,
      }

      -- Create buffer-local keymaps with a description
      local map = function(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = 0, desc = desc })
      end

      -- Create normal mode keymaps to `<Plug>` mappings
      local mapplug = function(keys, plugmap)
        map('n', keys, '<Plug>' .. plugmap, plugmap)
      end

      -- Wrapper for creating normal mode keymaps with `RSend`
      local mapcmd = function(keys, func)
        map('n', keys, '<Cmd>RSend ' .. func .. '<CR>', func)
      end

      opts.hook = {
        -- configure keymaps that don't require an R session
        on_filetype = function()
          vim.cmd([[setlocal keywordprg=:RHelp]]) -- Get help with <leader>K

          mapplug(',,', 'RStart')
          mapplug(']r', 'NextRChunk')
          mapplug('[r', 'PreviousRChunk')
          map('v', '<CR>', '<Plug>RSendSelection', 'Send Selection')
          mapplug('<CR>', 'RDSendLine')
          mapplug('<M-CR>', 'RInsertLineOutput')

          require('which-key').add({
            { '<localleader>r', group = 'R', icon = { icon = ' ', color = 'blue' } },
            { '<localleader>re', group = 'renv' },
          })

          mapplug('<localleader>r<CR>', 'RSendFile')
          mapplug('<localleader>rq', 'RClose')
          mapplug('<localleader>rD', 'RSetwd')

          mapcmd('<localleader>r?', 'getwd()')
          mapcmd('<localleader>rR', 'source(".Rprofile")')
          mapcmd('<localleader>rd', 'setwd(vim.fn.expand("<cword>"))')

          -- renv
          mapcmd('<localleader>re?', 'renv::status()')
          mapcmd('<localleader>res', 'renv::snapshot()')
          mapcmd('<localleader>rer', 'renv::restore()')
        end,
      }

      -- If R is remote, extend the options table with remote-specific settings
      -- To configure a remote R session, run `nvim --cmd "let g:R_is_remote = 1"`
      if vim.g.R_is_remote then
        opts = vim.tbl_extend('force', opts, {
          R_app = '/Users/rdn/.local/bin/sshR',
          R_cmd = '/Users/rdn/.local/bin/sshR',
          compldir = '/Users/rdn/.remoteR',
          remote_compldir = '/home/ubuntu/.cache/R.nvim',
          local_R_library_dir = '/Users/rdn/.local/share/nvim/lazy/R.nvim',
        })
      end

      return opts
    end,
  },

  {
    'quarto-dev/quarto-nvim',
    ft = { 'quarto' },
    dependencies = { 'jmbuhr/otter.nvim' },
    keys = { { '<leader>cp', '<Cmd>QuartoPreview<CR>' } },
    opts = { buffer = { write_to_disk = true } },
  },
}
