return {
  {
    -- highlighting for chezmoi files template files
    'alker0/chezmoi.vim',
    init = function()
      vim.g['chezmoi#use_tmp_buffer'] = 1
      vim.g['chezmoi#source_dir_path'] = os.getenv('HOME') .. '/.local/share/chezmoi'
    end,
  },
  {
    'xvzc/chezmoi.nvim',
    enabled = false,
    cmd = { 'ChezmoiEdit', 'ChezmoiList' },
    opts = {
      edit = {
        watch = false,
        force = false,
      },
    },
    -- init = function()
    --   vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufWritePost' }, {
    --     pattern = os.getenv('HOME') .. '/.config/vim/*',
    --     command = '!chezmoi add %',
    --   })
    --   -- run chezmoi edit on file enter
    --   vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
    --     pattern = { os.getenv('HOME') .. '/.local/share/chezmoi/*' },
    --     callback = function()
    --       vim.schedule(require('chezmoi.commands.__edit').watch)
    --     end,
    --   })
    --   -- TODO: delete?
    -- end,
  },

  {
    'echasnovski/mini.icons',
    opts = {
      file = {
        ['dot_zshrc'] = { glyph = '', hl = 'MiniIconsGreen' },
        ['.chezmoiignore'] = { glyph = '', hl = 'MiniIconsGrey' },
        ['.chezmoiremove'] = { glyph = '', hl = 'MiniIconsGrey' },
        ['.chezmoiroot'] = { glyph = '', hl = 'MiniIconsGrey' },
        ['.chezmoiversion'] = { glyph = '', hl = 'MiniIconsGrey' },
        ['bash.tmpl'] = { glyph = '', hl = 'MiniIconsGrey' },
        ['json.tmpl'] = { glyph = '', hl = 'MiniIconsGrey' },
        ['ps1.tmpl'] = { glyph = '󰨊', hl = 'MiniIconsGrey' },
        ['sh.tmpl'] = { glyph = '', hl = 'MiniIconsGrey' },
        ['toml.tmpl'] = { glyph = '', hl = 'MiniIconsGrey' },
        ['yaml.tmpl'] = { glyph = '', hl = 'MiniIconsGrey' },
        ['zsh.tmpl'] = { glyph = '', hl = 'MiniIconsGrey' },
      },
    },
  },
}
