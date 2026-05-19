-- Split arrays and methods onto multiple lines, or join them back up.

return {
  'Wansmer/treesj',
  dependencies = { 'neovim-treesitter/nvim-treesitter' },
  keys = {
    { '<leader>jj', function() require('treesj').join() end, desc = 'Join syntax node' },
    { '<leader>js', function() require('treesj').split() end, desc = 'Split syntax node' },
  },
  opts = {
    use_default_keymaps = false,
  },
}
