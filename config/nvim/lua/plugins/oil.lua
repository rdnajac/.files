-- config/nvim/lua/plugins/oil.lua
return {
  'stevearc/oil.nvim',
  lazy = false,
  cmd = 'Oil',
  keys = { { '-', '<CMD>Oil --float<CR>', desc = 'Open Oil in floating window' } },
  opts = {
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
    delete_to_trash = false,
    prompt_save_on_select_new_entry = true,
    skip_confirm_for_simple_edits = true,
    constrain_cursor = 'name',
    watch_for_changes = true,
    view_options = {
      show_hidden = false,
      winbar = '%!v:lua.get_oil_winbar()',
    },

    keymaps = {
      ['h'] = { 'actions.parent', mode = 'n' },
      ['<Left>'] = { 'actions.parent', mode = 'n' },
      ['l'] = { 'actions.select', mode = 'n' },
      ['<Right>'] = { 'actions.select', mode = 'n' },
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
  },
}
