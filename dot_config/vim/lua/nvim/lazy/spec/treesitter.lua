return {
  {
    'nvim-treesitter/nvim-treesitter',
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
    end,
    opts_extend = { 'ensure_installed' },
    opts = {
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<C-Space>',
          node_incremental = '<C-Space>',
          scope_incremental = false,
          node_decremental = '<BS>',
        },
      },
      ensure_installed = {
        -- 'asm',
        'bash',
        -- 'bibtex',
        'csv',
        'cmake',
        'cpp',
        'cuda',
        -- FIXME
        -- 'comment', -- HACK: this is a custom parser
        'diff',
        'dockerfile',
        'doxygen',
        'git_config',
        'gitcommit',
        'git_rebase',
        'gitattributes',
        'gitignore',
        'gitcommit',
        -- 'groovy',
        'html',
        'javascript',
        'jsdoc',
        'json',
        'jsonc',
        -- 'json5',
        'latex',
        'llvm',
        'luadoc',
        'luap',
        'make',
        'ocaml',
        'printf',
        'python',
        'regex',
	'r',
	'rnoweb',
        'toml',
        'xml',
        'yaml',
      },
      -- these come bundled with neovim
      ignore_install = {
        'c',
        'lua',
        'markdown',
        'markdown_inline',
        'query',
        'vim',
        'vimdoc',
      },
      -- textobjects = {
      --   move = {
      --     enable = true,
      --     goto_next_start = { [']f'] = '@function.outer', [']c'] = '@class.outer', [']a'] = '@parameter.inner' },
      --     goto_next_end = { [']F'] = '@function.outer', [']C'] = '@class.outer', [']A'] = '@parameter.inner' },
      --     goto_previous_start = { ['[f'] = '@function.outer', ['[c'] = '@class.outer', ['[a'] = '@parameter.inner' },
      --     goto_previous_end = { ['[F'] = '@function.outer', ['[C'] = '@class.outer', ['[A'] = '@parameter.inner' },
      --   },
      -- },
    },
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)

      -- FIXME: the parse doesn't automatically install from `GitHub`
      require('nvim-treesitter.parsers').get_parser_configs().comment = {
        install_info = {
          url = '~/GitHub/rdnajac/tree-sitter-comment',
          files = { 'src/parser.c' },
          branch = 'main',
        },
      }
    end,
  },
  -- {
  --   'nvim-treesitter/nvim-treesitter-textobjects',
  --   event = 'VeryLazy',
  --   enabled = true,
  --   config = function()
  --     -- If treesitter is already loaded, we need to run config again for textobjects
  --     if LazyVim.is_loaded('nvim-treesitter') then
  --       local opts = LazyVim.opts('nvim-treesitter')
  --       require('nvim-treesitter.configs').setup({ textobjects = opts.textobjects })
  --     end
  --
  --     -- When in diff mode, we want to use the default
  --     -- vim text objects c & C instead of the treesitter ones.
  --     local move = require('nvim-treesitter.textobjects.move') ---@type table<string,fun(...)>
  --     local configs = require('nvim-treesitter.configs')
  --     for name, fn in pairs(move) do
  --       if name:find('goto') == 1 then
  --         move[name] = function(q, ...)
  --           if vim.wo.diff then
  --             local config = configs.get_module('textobjects.move')[name] ---@type table<string,string>
  --             for key, query in pairs(config or {}) do
  --               if q == query and key:find('[%]%[][cC]') then
  --                 vim.cmd('normal! ' .. key)
  --                 return
  --               end
  --             end
  --           end
  --           return fn(q, ...)
  --         end
  --       end
  --     end
  --   end,
  -- },
}
