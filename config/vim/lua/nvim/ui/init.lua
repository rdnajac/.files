vim.opt.cmdheight = 0
vim.opt.pumblend = 0
vim.opt.signcolumn = 'yes'
vim.opt.winborder = 'rounded'

require('vim._extui').enable({
  enable = true,
  msg = {
    -- pos = 'cmd',
    pos = 'box',
    box = {
      timeout = 4000,
    },
  },
})
-- require('ui.mini_diff')
require('nvim.ui.hipatterns')
require('nvim.ui.icons')
require('nvim.ui.tokyonight')
require('nvim.ui.clangd')
-- require('nvim.ui.markdown')
