-- lua/plugins/snacks/toggle.lua
Snacks.toggle.animate():map('<leader>ua')
Snacks.toggle.diagnostics():map('<leader>ud')
Snacks.toggle.dim():map('<leader>uD')
Snacks.toggle.line_number():map('<leader>ul')
Snacks.toggle.option('relativenumber', { name = 'Relative Number' }):map('<leader>uL')
Snacks.toggle.option('laststatus', { off = 0, on = 3 }):map('<leader>uu')
Snacks.toggle.option('spell', { name = 'Spelling' }):map('<leader>us')
Snacks.toggle.option('wrap', { name = 'Wrap' }):map('<leader>uw')
Snacks.toggle.zoom():map('<leader>uZ')
Snacks.toggle.zen():map('<leader>uz')
Snacks.toggle.treesitter():map('<leader>uT')
Snacks.toggle.indent():map('<leader>ug')
Snacks.toggle.scroll():map('<leader>uS')
-- stylua: ignore start
Snacks.toggle.option('conceallevel', { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2, name = 'Conceal Level' }):map('<leader>uc')
Snacks.toggle.option('showtabline', { off = 0, on = vim.o.showtabline > 0 and vim.o.showtabline or 2, name = 'Tabline' }):map('<leader>uA')
-- stylua: ignore end

Snacks.toggle.profiler():map('<leader>dpp')
Snacks.toggle.profiler_highlights():map('<leader>dph')

if vim.lsp.inlay_hint then
  Snacks.toggle.inlay_hints():map('<leader>uh')
end

Snacks.toggle({
  name = 'Mini Diff Signs',
  get = function()
    return vim.g.minidiff_disable ~= true
  end,
  set = function(state)
    vim.g.minidiff_disable = not state
    if state then
      require('mini.diff').enable(0)
    else
      require('mini.diff').disable(0)
    end
    -- HACK: redraw to update the signs
    vim.defer_fn(function()
      vim.cmd([[redraw!]])
    end, 200)
  end,
}):map('<leader>uG')

Snacks.toggle({
  name = 'Virtual Text',
  get = function()
    return vim.diagnostic.config().virtual_text
  end,
  set = function(state)
    vim.diagnostic.config({ virtual_text = state })
  end,
}):map('<leader>uv', { desc = 'Toggle Virtual Text' })

Snacks.toggle({
  name = 'Color Column',
  get = function()
    return vim.opt.colorcolumn:get()[1] == '81'
  end,
  set = function(state)
    vim.opt.colorcolumn = state and '81' or ''
  end,
}):map('<leader>u\\', { desc = 'Toggle Color Column' })

-- TODO:
-- Snacks.toggle({
--   name = 'Send Line on <CR>',
--   get = function()
--     -- check if there is a keymap for SendLine
--     -- return vim.opt.colorcolumn:get()[1] == '81'
--   end,
--   set = function(state)
--     vim.opt.colorcolumn = state and '81' or ''
--   end,
-- }):map('<leader>u\\', { desc = 'Toggle Color Column' })

Snacks.toggle({
  name = 'Auto Advance (Line Feed)',
  get = function()
    return vim.g.cmd_auto_advance == '1'
  end,
  set = function(state)
    vim.g.cmd_auto_advance = state and '1' or '0'
  end,
}):map('<localleader>ta', { desc = 'Toggle Auto Advance' })

Snacks.toggle({
  name = 'Noice',
  get = function()
    return require('noice.config').is_running()
  end,
  set = function(state)
    if state then
      require('noice').enable()
    else
      require('noice').disable()
    end
  end,
}):map('<leader>uN', { desc = 'Toggle Noice' })
