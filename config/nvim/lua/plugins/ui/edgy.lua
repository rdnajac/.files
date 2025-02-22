return {
  'folke/edgy.nvim',
  enabled = false,
  ---@module 'edgy'
  ---@param opts Edgy.Config
  opts = function(_, opts)
    -- opts.left = {
    --   {
    --     title = 'oil',
    --     ft = 'oil',
    --     size = { width = 20 },
    --     filter = function(buf)
    --       return vim.bo[buf].filetype == 'oil'
    --     end,
    --   },
    -- }
    for _, pos in ipairs({ 'top', 'bottom', 'left', 'right' }) do
      opts[pos] = opts[pos] or {}
      table.insert(opts[pos], {
        ft = 'snacks_terminal',
        size = { height = 0.4 },
        title = '%{b:term_title}',
        filter = function(_buf, win)
          return vim.w[win].snacks_win
            and vim.w[win].snacks_win.position == pos
            and vim.w[win].snacks_win.relative == 'editor'
            and not vim.w[win].trouble_preview
        end,
      })
    end
  end,
}
