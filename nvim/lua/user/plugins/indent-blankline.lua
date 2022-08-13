require('indent_blankline').setup({
  filetype_exclude = {
    'help',
    'terminal',
    'dashboard',
    'packer',
    'lspinfo',
    'TelescopePrompt',
    'TelescopeResults',
  },
  buftype_exclude = {
    'terminal',
    'NvimTree',
  },
  show_trailing_blankline_indent = false,
  show_first_indent_level = true,
  -- show_end_of_line = true,
  -- space_char_blankline = ' ',
})

vim.api.nvim_set_hl(0, 'IndentBlanklineChar', { fg = '#2F313C' })
-- local highlight_group = vim.api.nvim_create_augroup('IndentBlanklineHighlight', { clear = true })
-- vim.api.nvim_create_autocmd('ColorScheme', {
--   group = highlight_group,
--   pattern = '*',
--   callback = function ()
--     vim.api.nvim_set_hl(0, 'IndentBlanklineChar', { fg = '#2F313C' })
--   end,
-- })
