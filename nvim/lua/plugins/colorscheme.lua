return {
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "night" },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
  {
    "LazyVim/LazyVim",
    opts = function(_, opts)
      local colors = {
        bg = "#000000",
        fg = "#39ff14",
        blue = "#14afff",
        magenta = "#ff69ff",
      }

      -- Override the LazyVim colorscheme setup
      opts.colorscheme = function()
        require("tokyonight").load()

        -- Apply custom highlights
        vim.api.nvim_set_hl(0, "Normal", { bg = colors.bg })
        vim.api.nvim_set_hl(0, "String", { fg = colors.fg })
        vim.api.nvim_set_hl(0, "Constant", { fg = colors.fg })
        -- Uncomment these if you want to use them
        -- vim.api.nvim_set_hl(0, 'Comment', { fg = colors.fg })
        -- vim.api.nvim_set_hl(0, 'Statement', { fg = colors.blue })
        -- vim.api.nvim_set_hl(0, 'PreProc', { fg = colors.blue })
        -- vim.api.nvim_set_hl(0, 'Type', { fg = colors.magenta })
        -- vim.api.nvim_set_hl(0, 'Special', { fg = colors.magenta })
        vim.api.nvim_set_hl(0, "DashboardDesc", { fg = colors.fg })
      end
    end,
  },
}
