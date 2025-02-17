return {
  'folke/tokyonight.nvim',
  lazy = false, -- make sure we load this during startup
  priority = 1000, -- and before all the other start plugins
  opts = {
    style = 'night',
    dim_inactive = true,
    transparent = false,
    styles = {
      comments = { italic = true },
      keywords = { italic = false, bold = true },
      sidebars = 'transparent',
      -- floats = 'transparent',
    },
    on_highlights = function(hl, c)
      -- local winbg = c.transparent and 'NONE' or '#000000'
      -- hl['NormalFloat'] = { fg = '#39ff14', bg = winbg }
      hl['@markup.raw.markdown_inline.comment'] = {
        fg = '#39ff14',
        bg = 'NONE',
      }
    end,
  },
}
