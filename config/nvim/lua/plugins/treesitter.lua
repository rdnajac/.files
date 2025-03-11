return {
  {
    'nvim-treesitter/nvim-treesitter',
    -- version = false, -- last release is way too old and doesn't work on Windows
    -- FIXME: The next commit breaks render-markdown
    -- commit = 'f0ff9f0',

    build = ':TSUpdate',
    event = { 'LazyFile', 'VeryLazy' },
    lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
    init = function(plugin)
      -- PERF: add nvim-treesitter queries to the rtp and it's custom query predicates early
      -- This is needed because a bunch of plugins no longer `require("nvim-treesitter")`, which
      -- no longer trigger the **nvim-treesitter** module to be loaded in time.
      -- Luckily, the only things that those plugins need are the custom queries, which we make available
      -- during startup.
      require('lazy.core.loader').add_to_rtp(plugin)
      require('nvim-treesitter.query_predicates')

      -- configure installation of custom parser
      require('nvim-treesitter.parsers').get_parser_configs().comment = {
        install_info = {
          -- BUG: not working... might need to require("nvim-treesitter.install").prefer_git = true
          -- or maybe the issue is the name collision
          -- install locally instead:
          -- url = 'https://github.com/rdnajac/tree-sitter-comment',
          url = '~/GitHub/rdnajac/tree-sitter-comment',
          files = { 'src/parser.c' },
          branch = 'main',
          requires_generate_from_grammar = true,
        },
      }
    end,
    cmd = { 'TSUpdateSync', 'TSUpdate', 'TSInstall' },
    keys = {
      { '<c-space>', desc = 'Increment Selection' },
      { '<bs>', desc = 'Decrement Selection', mode = 'x' },
    },
    config = function()
      ---@type TSConfig
      require('nvim-treesitter.configs').setup({
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
        ensure_installed = {
          'bash',
          'c',
          'comment',
          'diff',
          'html',
          'javascript',
          'jsdoc',
          'json',
          'jsonc',
          'latex',
          'lua',
          'luadoc',
          'luap',
          'markdown',
          'markdown_inline',
          'printf',
          'python',
          'query',
          'r',
          'rnoweb',
          'regex',
          'toml',
          -- 'tsx',
          -- 'typescript',
          'vim',
          'vimdoc',
          'xml',
          'yaml',
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<C-space>',
            node_incremental = '<C-space>',
            scope_incremental = false,
            node_decremental = '<bs>',
          },
        },
        textobjects = {
          -- stylua: ignore
          move = {
            enable = true,
            goto_next_start     = { [']f'] = '@function.outer', [']c'] = '@class.outer', [']a'] = '@parameter.inner' },
            goto_next_end       = { [']F'] = '@function.outer', [']C'] = '@class.outer', [']A'] = '@parameter.inner' },
            goto_previous_start = { ['[f'] = '@function.outer', ['[c'] = '@class.outer', ['[a'] = '@parameter.inner' },
            goto_previous_end   = { ['[F'] = '@function.outer', ['[C'] = '@class.outer', ['[A'] = '@parameter.inner' },
          },
        },
      })
    end,
  },

  -- Wisely add 'end' in Ruby, Lua, Vimscript, etc.
  { 'RRethy/nvim-treesitter-endwise', event = 'LazyFile' },
}
