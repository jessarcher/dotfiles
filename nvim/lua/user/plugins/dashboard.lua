vim.g.dashboard_custom_header = {
  '',
  '',
  '           ⢸⣦⡈⠻⣿⣿⣿⣿⣿⣿⣷⣦⡀',
  '           ⢸⣿⣿⣦⡈⠻⣿⣿⣿⣿⣿⣿⣿⣦⡀',
  '           ⢸⣿⣿⣿⣿⣦⡈⠻⣿⣿⣿⣿⣿⣿⣿⣦⡀',
  '           ⢸⣿⣿⣿⣿⣿⣿⣦⠈⠻⣿⣿⣿⣿⣿⣿⣿⣦⡀',
  '        ⢀⣀⣴⣿⣿⣿⣿⣿⣿⣿⡿  ⠈⠻⣿⣿⣿⣿⣿⣿⣿⣦⡀',
  '⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠁    ⠈⠻⣿⣿⣿⣿⣿⣿⣿⣦⡀',
  '  ⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠛⠉         ⠈⠛⠿⣿⣿⣿⣿⣿⣿⣦⡀',
}

vim.g.dashboard_custom_section = {
  a = { description = { '  New file                       ' }, command = 'enew' },
  b = { description = { '  Find file                 SPC f' }, command = 'Telescope find_files' },
  c = { description = { '  Recent files              SPC h' }, command = 'Telescope oldfiles' },
  d = { description = { '  Find Word                 SPC r' }, command = 'Telescope live_grep' },
}

vim.g.dashboard_custom_footer = {
  '',
}
