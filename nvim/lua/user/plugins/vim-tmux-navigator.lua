-- Navigate seamlessly between Vim windows and Tmux panes.

return {
  'christoomey/vim-tmux-navigator',
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
    "TmuxNavigatorProcessList",
  },
  init = function()
    vim.g.tmux_navigator_no_mappings = 1
  end,
  keys = {
    { "<c-h>", "<cmd>TmuxNavigateLeft<cr>", desc = 'Focus left pane' },
    { "<c-j>", "<cmd>TmuxNavigateDown<cr>", desc = 'Focus lower pane' },
    { "<c-k>", "<cmd>TmuxNavigateUp<cr>", desc = 'Focus upper pane' },
    { "<c-l>", "<cmd>TmuxNavigateRight<cr>", desc = 'Focus right pane' },
    { "<c-\\>", "<cmd>TmuxNavigatePrevious<cr>", desc = 'Focus previous pane' },
  }
}
