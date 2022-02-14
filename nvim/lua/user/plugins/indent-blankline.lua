vim.cmd([[
  highlight IndentBlanklineJess guifg=#2F313C gui=nocombine
]])

require('indent_blankline').setup {
  filetype_exclude = {
    'help',
    'terminal',
    'dashboard',
    'packer',
    'lspinfo',
    'TelescopePrompt',
    'TelescopeResults',
  },
  buftype_exclude = { 'terminal', 'NvimTree' },
  show_trailing_blankline_indent = false,
  show_first_indent_level = true,
  -- show_current_context = true,
  -- show_current_context_start = true,
  char_highlight_list = {
    'IndentBlanklineJess'
  }
}
