---@class snacks.picker.Config
local M = {
  win = {
    preview = {
      wo = {
        number = false,
        spell = false,
        statuscolumn = '',
      },
    },
  },
  layouts = {
    my_default_layout = {
      preview = 'main',
      layout = {
        backdrop = false,
        width = 40,
        min_width = 40,
        height = 0,
        position = 'left',
        border = 'none',
        box = 'vertical',
        {
          win = 'input',
          height = 1,
          border = 'rounded',
          title = '{title} {live} {flags}',
          title_pos = 'center',
        },
        { win = 'list', border = 'none' },
        { win = 'preview', title = '{preview}', height = 0.4, border = 'top' },
      },
      -- hidden = { 'preview' },
      -- hidden = function()
      --   return #vim.fn.getbufinfo({ buflisted = 1 }) == 0 and { 'preview' } or nil
      -- end
      -- auto_hide = { 'input' },
    },

    my_alternate_layout = {
      preset = 'ivy',
    },
  },

  sources = {

    files = {
      follow = true,
      layout = 'my_default_layout',
    },

    keymaps = {
      layout = 'my_alternate_layout',
    },
    -- layout = { preset = 'vertical', fullscreen = true } },
    -- notifications = {
    --   win = { preview = { wo = { wrap = true } } },
    --   layout = { preset = 'vertical', fullscreen = true },
    -- },
    explorer = {
      win = {
        list = {
          keys = {
            ['-'] = 'explorer_up',
            ['l'] = 'confirm',
            ['h'] = 'explorer_close',
            ['<Right>'] = 'confirm',
            ['<Left>'] = 'explorer_close',
            ['r'] = 'explorer_rename',
            ['c'] = 'explorer_copy',
            ['m'] = 'explorer_move',
            ['o'] = 'explorer_open',
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
      show_empty = true,
      hidden = true,
      follow = true,
      cwd = vim.fn.expand('$DOTDIR'),
    },

    nvimconfig = {
      finder = 'files',
      show_empty = true,
      hidden = true,
      follow = false,
      cwd = vim.fn.stdpath('config'),
    },

    -- FIXME:
    hardway = {
      finder = 'grep',
      hidden = true,
      ignored = true,
      follow = false,
      supports_live = true,

      cwd = vim.fn.expand('$XDG_CONFIG_HOME/vim/docs/learnvimscriptthehardway'),
      confirm = function(picker, item)
        picker:close()
        vim.cmd('!open ' .. Snacks.picker.util.path(item))
      end,
    },

    zoxide = {
      confirm = 'edit',
    },
  },
}

return M
