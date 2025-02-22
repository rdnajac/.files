return {
  'stevearc/oil.nvim',
  lazy = false,
  cmd = 'Oil',
  keys = {
    -- { '-', ':vs | wincmd w | vertical resize 25 | Oil<CR>', desc = 'Open parent directory in floating window' },
    { '_', '<CMD>Oil --float<CR>', desc = 'Open home directory' },
    -- { '-', '<cmd>vsplit | Oil<CR> ', desc = 'Open parent directory in a split' },
    -- seleact the first window after split
    -- { '-', '<cmd>vsplit | Oil<CR> <cmd>wincmd w', desc = 'Open parent directory in a split' },
  },
  init = function()
    vim.cmd([[
    au FileType oil setlocal nowrap nonumber norelativenumber
    au FileType oil silent! nnoremap <silent> <buffer> <Tab> :<C-U>close<CR>
    au FileType oil silent! nnoremap <silent> <buffer> q     :<C-U>close<CR>


    ]])
  end,

  opts = function()
    local git_status = require('util.git').new_git_status()
    local refresh = require('oil.actions').refresh
    local orig_refresh = refresh.callback

    refresh.callback = function(...)
      git_status = require('util.git').new_git_status()
      orig_refresh(...)
    end

    return {
      view_options = {

        winbar = '%!v:lua.get_oil_winbar()',
        default_file_explorer = true,
        skip_confirm_for_simple_edits = true,
        prompt_save_on_select_new_entry = false,
        constrain_cursor = 'name',

        buf_options = {
          buflisted = false,
          bufhidden = 'hide',
        },

        -- TODO: set blacklist? use fugitive?
        is_hidden_file = function(name, bufnr)
          local dir = require('oil').get_current_dir(bufnr)
          local is_dotfile = vim.startswith(name, '.') and name ~= '..'

          -- If no local directory (e.g., for SSH connections), hide only dotfiles
          if not dir then
            return is_dotfile
          end

          -- Dotfiles are hidden unless tracked
          if is_dotfile then
            return not git_status[dir].tracked[name]
          else
            return false
          end
        end,
      },

      keymaps = {
        ['gi'] = {
          desc = 'Toggle file detail view',
          callback = function()
            detail = not detail
            if detail then
              require('oil').set_columns({ 'icon', 'permissions', 'size', 'mtime' })
            else
              require('oil').set_columns({ 'icon' })
            end
          end,
        },
      },
    }
  end,
}
