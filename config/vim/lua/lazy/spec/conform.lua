return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>cf',
      function()
        require('conform').format({ async = true })
      end,
      desc = 'Format Buffer',
    },
    {
      '<leader>cF',
      function()
        require('conform').format({ formatters = { 'injected' } })
      end,
      mode = { 'n', 'v' },
      desc = 'Format Injected Langs',
    },
  },

  ---@module "conform"
  ---@type conform.setupOpts
  opts = {
    formatters_by_ft = {
      lua = { 'stylua' },
      python = { 'ruff' },
      quarto = { 'prettier', 'injected' },
      rmd = { 'injected' },
      r = { 'air' },
    },

    -- Set default options
    default_format_opts = {
      lsp_format = 'fallback',
    },

    formatters = {
      prettier = {
        command = 'prettier',
        -- HACK: tell prettier to recognize qmd
        args = { '--stdin-filepath', '$FILENAME', '--parser', 'markdown' },
      },
      shfmt = {
        command = 'shfmt',
        prepend_args = { '-bn', '-sr' },
      },
      styler = {
        command = 'Rscript',
        args = { '-e', 'styler::style_file(commandArgs(TRUE))', '$FILENAME' },
      },
    },
  },
  init = function()
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
