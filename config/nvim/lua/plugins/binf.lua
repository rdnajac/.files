return {
  { 'LukeGoodsell/nextflow-vim' },
  {
    'R-nvim/R.nvim',
    init = function()
      vim.g.rout_follow_colorscheme = true
    end,
    opts = function()
      ---@type RConfigUserOpts
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
          mapplug(',,', 'RStart')
          mapplug(']r', 'NextRChunk')
          mapplug('[r', 'PreviousRChunk')
          vim.cmd([[setlocal keywordprg=:RHelp]]) -- Get help with <leader>K
        end,

        -- configure keymaps for use within an R session
        after_R_start = function()
          require('which-key').add({
            { '<localleader>r', group = 'R', icon = { icon = ' ', color = 'blue' } },
            { '<localleader>re', group = 'renv' },
          })

          map('v', '<CR>', '<Plug>RSendSelection', 'Send Selection')

          mapplug('<CR>', 'RDSendLine')
          mapplug('<M-CR>', 'RInsertLineOutput')
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

      -- to configure a remote R session, run `nvim --cmd "let g:R_is_remote = 1"`
      if vim.g.R_is_remote then
        opts.R_app = '/Users/rdn/.local/bin/sshR'
        opts.R_cmd = '/Users/rdn/.local/bin/sshR'
        opts.compldir = '/Users/rdn/.remoteR'
        opts.remote_compldir = '/home/ubuntu/.cache/R.nvim'
        opts.local_R_library_dir = '/Users/rdn/.local/share/nvim/lazy/R.nvim'
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

  {
    'jpalardy/vim-slime',
    enabled = false,
    init = function()
      vim.g.slime_target = 'neovim'
      vim.g.slime_no_mappings = true
      vim.g.slime_python_ipython = 1
      vim.g.slime_input_pid = false
      vim.g.slime_suggest_default = true
      vim.g.slime_menu_config = false
      vim.g.slime_neovim_ignore_unlisted = true
      -- TODO: this is not the place to set this
      vim.b['quarto_is_python_chunk'] = false
    end,

    keys = function()
      local function mark_terminal()
        local job_id = vim.b.terminal_job_id
        vim.print('job_id: ' .. job_id)
      end

      local function set_terminal()
        vim.fn.call('slime#config', {})
      end

      return {
        { ',m', mark_terminal, desc = '[m]ark terminal' },
        { ',s', set_terminal, desc = '[s]et terminal' },
      }
    end,
  },

  { -- paste an image from the clipboard or drag-and-drop
    'HakonHarnes/img-clip.nvim',
    enabled = false,
    event = 'BufEnter',
    ft = { 'markdown', 'quarto', 'latex' },
    opts = {
      default = {
        dir_path = 'img',
      },
      filetypes = {
        markdown = {
          url_encode_path = true,
          template = '![$CURSOR]($FILE_PATH)',
          drag_and_drop = {
            download_images = false,
          },
        },
        quarto = {
          url_encode_path = true,
          template = '![$CURSOR]($FILE_PATH)',
          drag_and_drop = {
            download_images = false,
          },
        },
      },
    },
    config = function(_, opts)
      require('img-clip').setup(opts)
      vim.keymap.set('n', '<leader>ii', ':PasteImage<cr>', { desc = 'insert image from clipboard' })
    end,
  },

  { -- preview equations
    'jbyuki/nabla.nvim',
    enabled = false,
    keys = { { '<leader>qm', ':lua require"nabla".toggle_virt()<cr>', desc = 'toggle math equations' } },
  },

  {
    'benlubas/molten-nvim',
    enabled = false,
    build = ':UpdateRemotePlugins',
    init = function()
      vim.g.molten_image_provider = 'image.nvim'
      vim.g.molten_output_win_max_height = 20
      vim.g.molten_auto_open_output = false
    end,
    keys = {
      { '<leader>mi', ':MoltenInit<cr>', desc = '[m]olten [i]nit' },
      {
        '<leader>mv',
        ':<C-u>MoltenEvaluateVisual<cr>',
        mode = 'v',
        desc = 'molten eval visual',
      },
      { '<leader>mr', ':MoltenReevaluateCell<cr>', desc = 'molten re-eval cell' },
    },
  },
}
