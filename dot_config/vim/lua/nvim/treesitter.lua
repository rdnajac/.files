---@type TSConfig
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
  textobjects = {
    move = {
      enable = true,
      goto_next_start = { [']f'] = '@function.outer', [']c'] = '@class.outer', [']a'] = '@parameter.inner' },
      goto_next_end = { [']F'] = '@function.outer', [']C'] = '@class.outer', [']A'] = '@parameter.inner' },
      goto_previous_start = { ['[f'] = '@function.outer', ['[c'] = '@class.outer', ['[a'] = '@parameter.inner' },
      goto_previous_end = { ['[F'] = '@function.outer', ['[C'] = '@class.outer', ['[A'] = '@parameter.inner' },
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
    'comment', -- HACK: this is a custom parser
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
    'rnoweb',
    'regex',
    'toml',
    'r',
    'xml',
    'yaml',
    -- these come built-in with neovim
    -- 'vim',
    -- 'vimdoc',
    -- 'c',
    -- 'lua',
    -- 'markdown',
    -- 'markdown_inline',
    -- 'query',
  },
})

-- FIXME: the parse doesn't automatically install from `GitHub`
require('nvim-treesitter.parsers').get_parser_configs().comment = {
  install_info = {
    url = '~/GitHub/rdnajac/tree-sitter-comment',
    files = { 'src/parser.c' },
    branch = 'main',
  },
}

vim.keymap.set('n', '<leader>uI', function()
  vim.treesitter.inspect_tree()
  vim.api.nvim_input('I')
end, { desc = 'Inspect Tree' })

vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('kitty', { clear = true }),
  pattern = 'kitty',
  callback = function()
    if require('nvim-treesitter.parsers').has_parser('bash') then
      vim.treesitter.language.register('bash', 'kitty')
      vim.treesitter.start(0, 'bash')
    end
  end,
  desc = 'Use bash parser for kitty config',
})

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
-- return { mode = 'cursor', max_lines = 3 }
