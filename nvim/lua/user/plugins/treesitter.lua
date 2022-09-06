local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
parser_config.solidity = {
  install_info = {
    url = '~/Code/JoranHonig/tree-sitter-solidity/', -- local path or git repo
    files = { 'src/parser.c' },
  },
}

require('nvim-treesitter.configs').setup({
  auto_install = true,
  -- indent = true,
  -- indent = {
  --   enable = { 'php', 'html', 'blade' },
  -- },
  highlight = {
    enable = true,
    disable = { 'NvimTree' },
    additional_vim_regex_highlighting = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ['ia'] = '@parameter.inner',
        -- ['aa'] = {
        --   php = "" '@parameter.outer',

        --   python = "(function_definition) @function",
        --   cpp = "(function_definition) @function",
        --   c = "(function_definition) @function",
        --   java = "(method_declaration) @function",
        -- },
      },
    },
  },
  context_commentstring = {
    enable = true,
  },
  query_linter = {
    enable = true,
    use_virtual_text = true,
    lint_events = { 'BufWrite', 'CursorHold' },
  },
})
