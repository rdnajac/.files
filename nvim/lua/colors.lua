
local colors = {
    bg = '#000000',
    fg = '#39ff14',
    blue = '#14afff',
    magenta = '#ff69ff',
}

    vim.api.nvim_set_hl(0, 'Normal', { bg = colors.bg })
    -- vim.api.nvim_set_hl(0, 'Comment', { fg = colors.fg })
    vim.api.nvim_set_hl(0, 'Constant', { fg = colors.fg })
    -- vim.api.nvim_set_hl(0, 'Statement', { fg = colors.blue })
    -- vim.api.nvim_set_hl(0, 'PreProc', { fg = colors.blue })
    -- vim.api.nvim_set_hl(0, 'Type', { fg = colors.magenta })
    -- vim.api.nvim_set_hl(0, 'Special', { fg = colors.magenta })

