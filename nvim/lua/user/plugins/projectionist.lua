vim.g.projectionist_heuristics = {
  artisan = {
    ['*'] = {
      start = 'sail up',
      console = 'sail tinker',
      make = 'npm run dev',
    },
    ['app/Models/*.php'] = {
      type = 'model',
    },
    ['app/Http/Controllers/*.php'] = {
      type = 'controller',
    },
    ['routes/*.php'] = {
      type = 'route',
    },
    ['database/migrations/*.php'] = {
      type = 'migration',
    },
    ['app/*.php'] = {
      type = 'source',
      alternate = {
        'tests/Unit/{}Test.php',
        'tests/Feature/{}Test.php',
      },
    },
    ['tests/Feature/*Test.php'] = {
      type = 'test',
      alternate = 'app/{}.php',
    },
    ['tests/Unit/*Test.php'] = {
      type = 'test',
      alternate = 'app/{}.php',
    },
  },
}
