local keymap = require 'lib.utils'.keymap

keymap('n', '<Leader>tn', ':TestNearest<CR>', { silent = false })
keymap('n', '<Leader>tf', ':TestFile<CR>', { silent = false })
keymap('n', '<Leader>ts', ':TestSuite<CR>', { silent = false })
keymap('n', '<Leader>tl', ':TestLast<CR>', { silent = false })
keymap('n', '<Leader>tv', ':TestVisit<CR>', { silent = false })

vim.cmd([[
  let test#php#phpunit#executable = 'deliver vendor/bin/phpunit'
  let test#php#phpunit#options = '--colors=always'

  function! FloatermStrategy(cmd)
    execute 'FloatermKill scratch'
    execute 'FloatermNew! --autoclose=2 --name=scratch '.a:cmd.' |less -X'
  endfunction

  let g:test#custom_strategies = {'floaterm': function('FloatermStrategy')}
  let g:test#strategy = 'floaterm'
]])
