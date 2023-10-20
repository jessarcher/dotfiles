return {
  'petertriho/nvim-scrollbar',
  opts = {
    -- show_in_active_only = true,
    excluded_filetypes = {
      'neo-tree',
    },
    marks = {
      Cursor = {
        text = " ",
        priority = 99,
      },
    },
    handle = {
      blend = 90,
      highlight = "Cursor",
    },
  }
}
