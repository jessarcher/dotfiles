-- Show file and LSP context in a bar at the top of the screen.

return {
  'utilyre/barbecue.nvim',
  event = 'BufRead',
  dependencies = {
    {
      "SmiteshP/nvim-navic",
      opts = {
        lsp = {
          auto_attach = true,
          preference = { "intelephense" },
        }
      },
    },
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    theme = 'tokyonight',
  },
}
