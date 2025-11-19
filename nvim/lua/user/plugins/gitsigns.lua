-- Git integration

return {
  'lewis6991/gitsigns.nvim',
  lazy = false,
  keys = {
    { ']h', ':silent Gitsigns next_hunk<CR>'},
    { '[h', ':silent Gitsigns prev_hunk<CR>'},
    { 'gs', ':Gitsigns stage_hunk<CR>'},
    { 'gS', ':Gitsigns undo_stage_hunk<CR>'},
    { 'gp', ':Gitsigns preview_hunk<CR>'},
    { 'gb', ':Gitsigns blame_line<CR>'},
  },
  opts = {
    preview_config = {
      border = { '', '', '', ' ' },
    },
    current_line_blame = true,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
      delay = 500,
      ignore_whitespace = true,
    },
    signs = {
      add          = { text = '│' },
      change       = { text = '│' },
      delete       = { text = '_' },
      topdelete    = { text = '‾' },
      changedelete = { text = '┄' },
      untracked    = { text = '┊' },
    },
  },
}
