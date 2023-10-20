return {
  'RRethy/vim-illuminate',
  event = 'BufEnter',
  config = function()
    require('illuminate').configure({
      min_count_to_highlight = 2,
      delay = 1000,
      providers = { 'lsp' },
    })
  end,
}
