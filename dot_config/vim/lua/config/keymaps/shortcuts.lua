require('which-key').add({
  { '<localleader>p', function() Snacks.picker.lazy() end, desc = 'Search for Plugin Spec', },
  { '<localleader>i', '<Cmd>e ' .. vim.fn.stdpath('config') .. '/lua/nvim/init.lua<CR>', desc = 'init' },
  { '<localleader>a', '<Cmd>e ' .. vim.fn.stdpath('config') .. '/lua/config/autocmds<CR>', desc = 'autocmds' },
  { '<localleader>k', '<Cmd>e ' .. vim.fn.stdpath('config') .. '/lua/config/keymaps<CR>', desc = 'keymaps' },
  { '<localleader>o', '<Cmd>e ' .. vim.fn.stdpath('config') .. '/lua/config/options<CR>', desc = 'options' },
  { '<localleader>s', '<Cmd>e ' .. vim.fn.expand('~/.ssh/config') .. '<CR>', desc = 'ssh' },
})
