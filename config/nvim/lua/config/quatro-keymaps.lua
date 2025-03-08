-- https://github.com/jmbuhr/quarto-nvim-kickstarter
-- normal mode with <leader>
wk.add({
  {
    { "<leader>o", group = "[o]tter & c[o]de" },
    { "<leader>oa", require'otter'.activate, desc = "otter [a]ctivate" },
    { "<leader>ob", insert_bash_chunk, desc = "[b]ash code chunk" },
    { "<leader>oc", "O# %%<cr>", desc = "magic [c]omment code chunk # %%" },
    { "<leader>od", require'otter'.activate, desc = "otter [d]eactivate" },


    { "<leader>q", group = "[q]uarto" },
    { "<leader>qE", function() require('otter').export(true) end, desc = "[E]xport with overwrite" },
    { "<leader>qa", ":QuartoActivate<cr>", desc = "[a]ctivate" },
    { "<leader>qe", require('otter').export, desc = "[e]xport" },
    { "<leader>qh", ":QuartoHelp ", desc = "[h]elp" },
    { "<leader>qp", ":lua require'quarto'.quartoPreview()<cr>", desc = "[p]review" },
    { "<leader>qq", ":lua require'quarto'.quartoClosePreview()<cr>", desc = "[q]uiet preview" },

    { "<leader>qr", group = "[r]un" },
    { "<leader>qra", ":QuartoSendAll<cr>", desc = "run [a]ll" },
    { "<leader>qrb", ":QuartoSendBelow<cr>", desc = "run [b]elow" },
    { "<leader>qrr", ":QuartoSendAbove<cr>", desc = "to cu[r]sor" },


    { "<leader>x", group = "e[x]ecute" },
    { "<leader>xx", ":w<cr>:source %<cr>", desc = "[x] source %" },
  }
}, { mode = 'n'})
