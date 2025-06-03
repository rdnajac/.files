return {
  { 'folke/lazy.nvim', version = false },
  {
    'folke/tokyonight.nvim',
    priority = 1001,
    opts = {
      style = 'night',
      dim_inactive = true,
      transparent = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = false, bold = true },
        sidebars = 'transparent',
        floats = 'transparent',
      },
      on_highlights = function(hl, _)
        hl['Folded'] = { fg = '#7aa2f7', bg = '#16161d' }
        hl['String'] = { fg = '#39ff14' }
        hl['SpecialWindow'] = { bg = '#1f2335' }
        -- hl['NormalFloat'] = { bg = '#1f2335' }
        hl['SpellBad'] = { bg = '#ff0000' }
        hl['CopilotSuggestion'] = { bg = '#414868', fg = '#7AA2F7' }
      end,
    },
  },
  { -- https://github.com/folke/snacks.nvim?tab=readme-ov-file#-features
    'folke/snacks.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      bigfile = { enabled = true },
      dashboard = require('munchies.dashboard').opts,
      explorer = { enabled = false },
      image = { enabled = true },
      indent = { indent = { only_current = true, only_scope = true } },
      input = { enabled = true },
      notifier = { enabled = false },
      -- notifier = { style = 'fancy', date_format = '%T', timeout = 3000 },
      picker = require('munchies.picker').opts,
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      -- statuscolumn = { left = { 'sign' }, right = { 'git' } },
      terminal = {
        start_insert = true,
        auto_insert = false,
        auto_close = true,
        win = { wo = { winbar = '', winhighlight = 'Normal:SpecialWindow' } },
      },
      words = { enabled = true },
    },
    init = function()
      vim.api.nvim_create_autocmd('User', {
        pattern = 'VeryLazy',
        callback = function()
          -- Setup some globals for debugging (lazy-loaded)
          _G.dd = function(...)
            Snacks.debug.inspect(...)
          end
          _G.bt = function()
            Snacks.debug.backtrace()
          end
          vim.print = _G.dd -- Override print to use snacks for `:=` command

          vim.api.nvim_create_user_command('Scriptnames', function()
            require('munchies.picker').scriptnames()
          end, { desc = 'Scriptnames' })

          vim.api.nvim_create_user_command('Chezmoi', function()
            require('munchies.picker').chezmoi()
          end, { desc = 'Chezmoi' })
          -- toggles
          Snacks.toggle.profiler():map('<leader>dpp')
          Snacks.toggle.profiler_highlights():map('<leader>dph')
          Snacks.toggle.option('autochdir'):map('<leader>ta')
          Snacks.toggle
            .option('showtabline', { off = 0, on = vim.o.showtabline > 0 and vim.o.showtabline or 2, name = 'Tabline' })
            :map('<leader>uA')
          Snacks.toggle
            .option(
              'conceallevel',
              { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2, name = 'Conceal Level' }
            )
            :map('<leader>uc')
          Snacks.toggle.option('relativenumber', { name = 'Relative Number' }):map('<leader>uL')
          Snacks.toggle.option('spell', { name = 'Spelling' }):map('<leader>us')
          Snacks.toggle.option('laststatus', { off = 0, on = 3 }):map('<leader>uu')
          Snacks.toggle.option('wrap', { name = 'Wrap' }):map('<leader>uw')
          Snacks.toggle.option('list'):map('<leader>u?')

          Snacks.toggle.animate():map('<leader>ua')
          Snacks.toggle.diagnostics():map('<leader>ud')
          Snacks.toggle.dim():map('<leader>uD')
          Snacks.toggle.line_number():map('<leader>ul')
          Snacks.toggle.treesitter():map('<leader>uT')
          Snacks.toggle.indent():map('<leader>ug')
          Snacks.toggle.scroll():map('<leader>uS')
          Snacks.toggle.words():map('<leader>uW')
          Snacks.toggle.zoom():map('<leader>uZ')

          if vim.lsp.inlay_hint then
            Snacks.toggle.inlay_hints():map('<leader>uh')
          end

          -- Custom toggles
          require('munchies.toggle').translucency():map('<leader>ub', { desc = 'Toggle Translucent Background' })
          require('munchies.toggle').virtual_text():map('<leader>uv', { desc = 'Toggle Virtual Text' })
          require('munchies.toggle').color_column():map('<leader>u\\', { desc = 'Toggle Color Column' })
        end,
      })
    end,
  },
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {
      show_help = false,
     keys = {
        scroll_down = '<C-j>',
        scroll_up = '<C-k>',
      },
      preset = 'helix',
      sort = { 'order', 'alphanum', 'mod' },
      spec = {
        {
          -- TODO: offload these to keymaps.lua
          mode = { 'n' },
          -- { '<localleader>l', desc = '+vimtex' },
          -- { '<localleader>r', group = '+R', icon = { icon = ' ', color = 'blue' } },
          -- { '<localleader>re', group = '++renv' },

          -- add icons for existing (vim) keymaps
          { '<leader>a', icon = { icon = ' ', color = 'azure' }, desc = 'Select All' },
          { '<leader>r', icon = { icon = ' ', color = 'azure' } },
          { '<leader>v', icon = { icon = ' ', color = 'azure' } },
          { '<leader>ft', icon = { icon = ' ', color = 'azure' } },
          {
            '<leader>b',
            group = 'buffer',
            expand = function()
              return require('which-key.extras').expand.buf()
            end,
          },
          {
            '<c-w>',
            group = 'windows',
            expand = function()
              return require('which-key.extras').expand.win()
            end,
          },
          -- TODO: add unimpaired toggles
          -- yob	'background' (dark is off, light is on)
          -- yoc	'cursorline'
          -- yod	'diff' (actually |:diffthis| / |:diffoff|)
          -- yoh	'hlsearch'
          -- yoi	'ignorecase'
          -- yol	'list'
          -- yon	'number'
          -- yor	'relativenumber'
          -- yos	'spell'
          -- yot	'colorcolumn' ("+1" or last used value)
          -- you	'cursorcolumn'
          -- yov	'virtualedit'
          -- yow	'wrap'
          -- yox	'cursorline' 'cursorcolumn' (x as in crosshairs)
        },
        mode = { 'n', 'v' },
        { '[', group = 'prev' },
        { ']', group = 'next' },
        { 'g', group = 'goto' },
        { 'z', group = 'fold' },

        -- better descriptions
        { 'gx', desc = 'Open with system app' },

        -- keep things tidy
        { 'g~', hidden = true },
        { 'gc', hidden = true },
      },
    },
  },
}
