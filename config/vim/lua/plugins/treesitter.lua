return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = 'VeryLazy',
    lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
    init = function(plugin)
      -- PERF: add nvim-treesitter queries to the rtp and it's custom query predicates early
      -- This is needed because a bunch of plugins no longer `require("nvim-treesitter")`, which
      -- no longer trigger the **nvim-treesitter** module to be loaded in time.
      -- Luckily, the only things that those plugins need are the custom queries, which we make available
      -- during startup.
      require('lazy.core.loader').add_to_rtp(plugin)
      require('nvim-treesitter.query_predicates')
    end,
    cmd = { 'TSUpdateSync', 'TSUpdate', 'TSInstall' },
    keys = {
      { '<c-space>', desc = 'Increment Selection' },
      { '<bs>', desc = 'Decrement Selection', mode = 'x' },
    },
    config = function()
      require('nvim-treesitter.configs').setup({
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<C-space>',
            node_incremental = '<C-space>',
            scope_incremental = false,
            node_decremental = '<bs>',
          },
        },
        -- textobjects = {
        --   move = {
        --     enable = true,
        --     goto_next_start = { [']f'] = '@function.outer', [']c'] = '@class.outer', [']a'] = '@parameter.inner' },
        --     goto_next_end = { [']F'] = '@function.outer', [']C'] = '@class.outer', [']A'] = '@parameter.inner' },
        --     goto_previous_start = { ['[f'] = '@function.outer', ['[c'] = '@class.outer', ['[a'] = '@parameter.inner' },
        --     goto_previous_end = { ['[F'] = '@function.outer', ['[C'] = '@class.outer', ['[A'] = '@parameter.inner' },
        --   },
        -- }
        ensure_installed = {
          -- 'asm',
          'bash',
          'c',
          'cpp',
          'cuda',
          'comment', -- HACK: this is a custom parser
          'diff',
          'doxygen',
          -- 'groovy',
          'html',
          'javascript',
          'jsdoc',
          'json',
          'jsonc',
          -- 'latex',
          'llvm',
          'lua',
          'luadoc',
          'luap',
          'make',
          'markdown',
          'markdown_inline',
          'printf',
          'python',
          'query',
          'r',
          'rnoweb',
          'regex',
          'toml',
          -- 'tmux',
          -- 'tsx',
          -- 'typescript',
          'vim',
          'vimdoc',
          'xml',
          'yaml',
        },
      })
      -- FIXME: the parse doesn't automatically install from GitHub
      require('nvim-treesitter.parsers').get_parser_configs().comment = {
        install_info = {
          url = '~/GitHub/rdnajac/tree-sitter-comment',
          files = { 'src/parser.c' },
          branch = 'main',
        },
      }
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter-context',
    event = 'VeryLazy',
    opts = function()
      local tsc = require('treesitter-context')
      Snacks.toggle({
        name = 'Treesitter Context',
        get = tsc.enabled,
        set = function(state)
          if state then
            tsc.enable()
          else
            tsc.disable()
          end
        end,
      }):map('<leader>ut')
      return { mode = 'cursor', max_lines = 3 }
    end,
  },
}
