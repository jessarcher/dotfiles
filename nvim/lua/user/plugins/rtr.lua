-- Set working directory to project root

return {
  'delphinus/rtr.nvim',
  opts = {
    root_names = { ".git", "Makefile", "composer.json" },
    log_level = false,
  },
}
