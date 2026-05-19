-- PHP Refactoring Tools

return {
  'phpactor/phpactor',
  build = 'composer install --no-dev --optimize-autoloader',
  ft = 'php',
  keys = {
    { '<Leader>pm', ':PhpactorContextMenu<CR>', desc = 'Open Phpactor context menu' },
    { '<Leader>pn', ':PhpactorClassNew<CR>', desc = 'Create new PHP class' },
  }
}
