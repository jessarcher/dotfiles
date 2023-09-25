return {
  'lewis6991/gitsigns.nvim',
  lazy = false,
  keys = {
    { ']h', ':Gitsigns next_hunk<CR>'},
    { '[h', ':Gitsigns prev_hunk<CR>'},
    { 'gs', ':Gitsigns stage_hunk<CR>'},
    { 'gS', ':Gitsigns undo_stage_hunk<CR>'},
    { 'gp', ':Gitsigns preview_hunk<CR>'},
    { 'gb', ':Gitsigns blame_line<CR>'},
  },
  opts = {
    signs = {
      add = { text = '⢕' },
      change = { text = '⢕' },
    },
  },
}
