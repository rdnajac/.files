return {
  { 'LukeGoodsell/nextflow-vim' },
  {
    'R-nvim/R.nvim',
    dev = false,
    opts = function()
      require('r.pdf.generic').open = vim.ui.open
      vim.g.rout_follow_colorscheme = true

      ---@type RConfigUserOpts
      return {
        user_maps_only = true,
      }
    end,
    -- stylua: ignore
    keys = {
      -- TODO: move these to opts.hook.on_filetype?
      { ',,',     '<Plug>RStart',            desc = 'Start R' },
      -- { '<CR>',   '<Plug>RDSendLine',        desc = 'Send Line' },
      { '<M-CR>', '<Plug>RInsertLineOutput', desc = 'Insert Line Output' },
      { ',r?',    '<Cmd>RSend getwd()<CR>',  desc = 'Get working directory' },
      { ',rR',    '<Cmd>RSend(source(".Rprofile"))<CR>', desc = 'Source .Rprofile' },
      -- ,rd to set directory
      -- ,rp to install plucin/packages
      -- ,r? to getwd
      -- ,rl clear woth <c-L>
      -- ,rq quit
      -- set nvim directoruy to <cword>?
    },
  },

  -- TODO: Conditionally set additional opts for remote R
  -- {
  --   'R-nvim/R.nvim',
  --   condition = false,
  --   opts = {
  --     R_app = '/Users/rdn/.local/bin/sshR',
  --     R_cmd = '/Users/rdn/.local/bin/sshR',
  --     compldir = '/Users/rdn/.remoteR',
  --     remote_compldir = '/home/ubuntu/.cache/R.nvim',
  --     local_R_library_dir = '/Users/rdn/.local/share/nvim/lazy/R.nvim',
  --   },
  -- },

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

  { -- directly open ipynb files as quarto docuements and convert back behind the scenes
    'GCBallesteros/jupytext.nvim',
    enabled = false,
    opts = {
      custom_language_formatting = {
        python = {
          extension = 'qmd',
          style = 'quarto',
          force_ft = 'quarto',
        },
        r = {
          extension = 'qmd',
          style = 'quarto',
          force_ft = 'quarto',
        },
      },
    },
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
