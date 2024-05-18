-- Indentation lines

return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  opts = {
    scope = {
      show_start = false,
    },
    exclude = {
      filetypes = {
        'dashboard',
      },
    },
  }
}
