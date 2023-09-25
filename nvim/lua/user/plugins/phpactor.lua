return {
  'phpactor/phpactor',
  build = 'composer install --no-dev --optimize-autoloader',
  ft = 'php',
  keys = {
    { '<Leader>pm', ':PhpactorContextMenu<CR>' },
    { '<Leader>pn', ':PhpactorClassNew<CR>' },
  }
}
