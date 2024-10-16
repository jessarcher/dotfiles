-- File explorer

return {
  'stevearc/oil.nvim',
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {},
  keys = {
    { '-', ':Oil<CR>', desc = 'Open parent directory' },
  },
}
