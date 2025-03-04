---@module 'snacks'
---@class snacks.picker.Config
return {
  sources = {
    files = { follow = true },
    keymaps = { layout = { preset = 'vertical', fullscreen = true } },
    notifications = {
      win = { preview = { wo = { wrap = true } } },
      layout = { preset = 'vertical', fullscreen = true },
    },
    explorer = {
      win = {
        list = {
          keys = {
            ['-'] = 'explorer_up',
            ['l'] = 'confirm',
            ['h'] = 'explorer_close', -- close directory
            ['<Right>'] = 'confirm',
            ['<Left>'] = 'explorer_close', -- close directory
            ['r'] = 'explorer_rename',
            ['c'] = 'explorer_copy',
            ['m'] = 'explorer_move',
            ['o'] = 'explorer_open', -- open with system application
            ['P'] = 'toggle_preview',
            ['y'] = { 'explorer_yank', mode = { 'n', 'x' } },
            ['p'] = 'explorer_paste',
            ['u'] = 'explorer_update',
          },
        },
      },
    },

    dotfiles = {
      finder = 'files',
      -- format = 'file',
      show_empty = true,
      hidden = true,
      ignored = false,
      follow = true,
      supports_live = true,
      cwd = vim.fn.expand('$DOTDIR'),
    },

    learnvimscriptthehardway = {
      finder = 'grep',
      ignored = true,
      cwd = vim.fn.expand('$XDG_CONFIG_HOME/vim/docs/learnvimscriptthehardway/'),
      confirm = function(picker, item)
        vim.cmd('!open ' .. item._path)
        picker:close()
      end,
    },
  },
  win = {
    input = {
      -- stylua: ignore
      keys = {
        ['<a-c>'] = { 'toggle_cwd',   mode = { 'n', 'i' }, },
        ['<a-t>'] = { 'trouble_open', mode = { 'n', 'i' }, },
      } ,
    },
  },
  actions = {
    toggle_cwd = function(p)
      local root = LazyVim.root({ buf = p.input.filter.current_buf, normalize = true })
      local cwd = vim.fs.normalize((vim.uv or vim.loop).cwd() or '.')
      local current = p:cwd()
      p:set_cwd(current == root and cwd or root)
      p:find()
    end,
    require('trouble.sources.snacks').actions,
  },
}
