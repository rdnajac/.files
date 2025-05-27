-- FIXME: the parse doesn't automatically install from `GitHub`
require('nvim-treesitter.parsers').get_parser_configs().comment = {
  install_info = {
    url = '~/GitHub/rdnajac/tree-sitter-comment',
    files = { 'src/parser.c' },
    branch = 'main',
  },
}
