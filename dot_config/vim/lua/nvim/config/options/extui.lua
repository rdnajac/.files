vim.opt.cmdheight = 0
require('vim._extui').enable({
  msg = {
    pos = 'box',
    box = { timeout = 4000 },
  },
})
