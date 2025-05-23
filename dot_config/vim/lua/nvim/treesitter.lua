-- FIXME: the parse doesn't automatically install from `GitHub`
require('nvim-treesitter.parsers').get_parser_configs().comment = {
  install_info = {
    url = '~/GitHub/rdnajac/tree-sitter-comment',
    files = { 'src/parser.c' },
    branch = 'main',
  },
}


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
