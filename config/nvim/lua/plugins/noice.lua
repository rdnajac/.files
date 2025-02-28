return {
  'folke/noice.nvim',
  enabled = true,
  event = 'VeryLazy',
  ---@class NoiceConfig
  opts = {
    lsp = { signature = { auto_open = { enabled = false } } },
    presets = { lsp_doc_border = true, },
    ---@type table<string, CmdlineFormat>
    cmdline = {
      enabled = true,
      view = 'cmdline',
      format = {
        cmdline = { pattern = '^:', icon = ':', lang = 'vim' },
        -- filter = { pattern = '^:%s*!', icon = '!', lang = 'bash' },
      },
    },

    -- redirect = {
    --   view = 'popup',
    --   filter = { event = 'msg_show' },
    -- },

    ---@type NoiceRouteConfig[]
    routes = {
      {
        filter = {
          event = 'msg_show',
          find = '^E486: Pattern not found',
        },
        opts = {
          skip = true,
        },
      },
      -- { find = 'E85: There is no listed buffer' },
      -- { find = 'E490: No fold found' },
      -- { find = 'Already at oldest change' },
    },

  },

  -- stylua: ignore
  keys = {
    { "<leader>sn", "", desc = "+noice"},
    { "<C-Enter>", function() require("noice").redirect(vim.fn.getcmdline()) end, mode = "c", desc = "Redirect Cmdline" },
    { "<leader>snl", function() require("noice").cmd("last") end, desc = "Noice Last Message" },
    { "<leader>snh", function() require("noice").cmd("history") end, desc = "Noice History" },
    { "<leader>sna", function() require("noice").cmd("all") end, desc = "Noice All" },
    { "<leader>snd", function() require("noice").cmd("dismiss") end, desc = "Dismiss All" },
    { "<leader>snt", function() require("noice").cmd("pick") end, desc = "Noice Picker (Telescope/FzfLua)" },
    { "<c-f>", function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end, silent = true, expr = true, desc = "Scroll Forward", mode = {"i", "n", "s"} },
    { "<c-b>", function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true, expr = true, desc = "Scroll Backward", mode = {"i", "n", "s"}},
  },

  -- config = function(_, opts)
  --   vim.cmd([[set cmdheight=0]])
  -- end,
}
