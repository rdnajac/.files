return {
  { 'catppuccin', enabled = false },
  {
    'folke/tokyonight.nvim',
    lazy = false, -- make sure we load this during startup
    priority = 1000, -- and before all the other start plugins
    opts = {
      style = 'storm',
      dim_inactive = true,
      transparent = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = false, bold = true },
        sidebars = 'transparent',
        floats = 'transparent',
      },
      -- on_highlights = function(hl, c)
      on_highlights = function(hl, _)
        hl['Folded'] = { fg = '#39FF14', bg = 'none' }
        hl['String'] = { fg = '#39ff14' }
        hl['SpecialWindow'] = { bg = '#1f2335' }
      end,
    },
  },
}
