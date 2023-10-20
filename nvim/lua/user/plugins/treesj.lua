return {
  'Wansmer/treesj',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  keys = {
    { 'gJ', function() require('treesj').join() end },
    { 'gS', function() require('treesj').split() end },
  },
  opts = {
    use_default_keymaps = false,
  },
}
