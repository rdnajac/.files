-- config/nvim/lua/plugins/oil.lua
return {
  'stevearc/oil.nvim',
  lazy = false,
  cmd = 'Oil',
  keys = {
    { '-', '<Cmd>Oil --float<CR>', desc = 'Open Oil in floating window' },
    { '_', '<Cmd>Oil<CR>', desc = 'Open Oil' },
  },
  opts = function()
    local git_status = require('util.git').new_git_status()
    local refresh = require('oil.actions').refresh
    local orig_refresh = refresh.callback

    refresh.callback = function(...)
      git_status = require('util.git').new_git_status()
      orig_refresh(...)
    end

    -- Snacks Rename
    vim.api.nvim_create_autocmd('User', {
      pattern = 'OilActionsPost',
      callback = function(event)
        if event.data.actions.type == 'move' then
          Snacks.rename.on_rename_file(event.data.actions.src_url, event.data.actions.dest_url)
        end
      end,
    })

    -- Delete file and buffer
    vim.api.nvim_create_autocmd('User', {
      pattern = 'OilActionsPre',
      callback = function(event)
        -- TODO: is this loop necessary?
        for _, action in ipairs(event.data.actions) do
          if action.type == 'delete' then
            local _, path = require('oil.util').parse_url(action.url)
            Snacks.bufdelete({ file = path, force = true })
          end
        end
      end,
    })

    return {
      default_file_explorer = true,
      columns = {},
      buf_options = {
        buflisted = false,
        bufhidden = 'hide',
      },
      win_options = {
        number = false,
        relativenumber = false,
      },
      -- delete_to_trash = true,
      prompt_save_on_select_new_entry = true,
      skip_confirm_for_simple_edits = true,
      constrain_cursor = 'name',
      watch_for_changes = true,
      view_options = {
        winbar = '%!v:lua.get_oil_winbar()',
        show_hidden = false,
        is_hidden_file = function(name, bufnr)
          local dir = require('oil').get_current_dir(bufnr)
          local is_dotfile = vim.startswith(name, '.') and name ~= '..'
          if not dir then
            return is_dotfile
          end
          if is_dotfile then
            return not git_status[dir].tracked[name]
          else
            -- return git_status[dir].ignored[name]
            return false
          end
        end,
      },

      keymaps = {
        ['h'] = { 'actions.parent', mode = 'n' },
        ['l'] = { 'actions.select', mode = 'n' },
        ['q'] = { 'actions.close', mode = 'n' },
        ['<Tab>'] = { 'actions.close', mode = 'n' },
        ['gi'] = {
          desc = 'Toggle file detail view',
          callback = function()
            detail = not detail
            if detail then
              require('oil').set_columns({ 'icon', 'permissions', 'size', 'mtime' })
            else
              require('oil').set_columns({})
            end
          end,
        },
      },

      -- Extra arguments to pass to SCP when moving/copying files over SSH
      extra_scp_args = {},
      -- EXPERIMENTAL support for performing file operations with git
      git = {
        -- Return true to automatically git add/mv/rm files
        add = function(path)
          return false
        end,
        mv = function(src_path, dest_path)
          return false
        end,
        rm = function(path)
          return false
        end,
      },
    }
  end,

  init = function()
    -- Declare a global function to retrieve the current directory
    function _G.get_oil_winbar()
      local bufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid)
      local dir = require('oil').get_current_dir(bufnr)
      if dir then
        return vim.fn.fnamemodify(dir, ':~')
      else
        -- If there is no current directory (e.g. over ssh), just show the buffer name
        return vim.api.nvim_buf_get_name(0)
      end
    end
  end,
}
