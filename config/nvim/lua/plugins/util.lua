return {

  {
    ---@module 'snacks'
    'folke/snacks.nvim',
    init = function()
      vim.api.nvim_create_autocmd('User', {
        pattern = 'VeryLazy',
      -- stylua: ignore
      callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        _G.dd = function(...) Snacks.debug.inspect(...) end
        _G.bt = function()    Snacks.debug.backtrace()  end
        -- Override print to use snacks for `:=` command
        vim.print = _G.dd
        -- Prepend any cmd with `Snacks` with lua to run it correctly
        vim.cmd([[
        cnoreabbrev <expr> Snacks getcmdtype() == ':' && getcmdline() =~ '^Snacks' ? 'lua Snacks' : 'Snacks'
        ]])
      end,
      })
    end,

    ---@class snacks.picker.Config
    opts = {
      picker = {
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
            show_empty = true,
            hidden = true,
            ignored = false,
            follow = true,
            cwd = vim.fn.expand('$DOTDIR'),
          },

          nvimconfig = {
            finder = 'files',
            show_empty = true,
            hidden = true,
            ignored = false,
            follow = true,
            cwd = vim.fn.stdpath('config'),
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

          zoxide = {
            confirm = 'edit',
          },
        },
      },
    },
  },

  {
    'folke/persistence.nvim',
    init = function()
      require('which-key').add({ { '<leader>p', group = 'Persistence', icon = ' ' } })
    end,
    keys = function()
    -- stylua: ignore
      return {
        { "<leader>ps", function() require("persistence").load() end, desc = "Restore Session" },
        { "<leader>pS", function() require("persistence").select() end,desc = "Select Session" },
        { "<leader>pl", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
        { "<leader>pd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
      }
    end,
  },

  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    enabled = false,
    opts = {
      menu = { width = vim.api.nvim_win_get_width(0) - 4 },
      settings = { save_on_toggle = true },
    },
    keys = function()
      -- stylua: ignore
      local keys = {
        { "<leader>H", function() require("harpoon"):list():add() end, desc = "Harpoon File", },
        { '<leader>\\', function() require('harpoon'):list():add() end, desc = 'Harpoon File', },
        { "<leader>h", function() local harpoon = require("harpoon") harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "Harpoon Quick Menu",},
        { '<localleader>\\', function() local harpoon = require('harpoon') harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = 'Harpoon Quick Menu',},
      }
      for i = 1, 5 do
        table.insert(keys, {
          '\\' .. i,
          function()
            require('harpoon'):list():select(i)
          end,
          desc = 'Harpoon to File ' .. i,
        })
      end
      return keys
    end,
  },
}
