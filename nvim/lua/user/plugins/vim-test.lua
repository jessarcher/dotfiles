-- Testing helper

return {
  'vim-test/vim-test',
  keys = {
    { '<Leader>tn', ':silent only | :silent TestNearest<CR>', desc = 'Run nearest test' },
    { '<Leader>tf', ':silent only | :silent TestFile<CR>', desc = 'Run test file' },
    { '<Leader>ts', ':silent only | :silent TestSuite<CR>', desc = 'Run test suite' },
    { '<Leader>tl', ':silent only | :silent TestLast<CR>', desc = 'Run last test' },
    { '<Leader>tv', ':silent only | :silent TestVisit<CR>', desc = 'Visit last test file' },
  },
  -- dependencies = { 'voldikss/vim-floaterm' },
  config = function()
    vim.cmd([[
      function! PhpUnitTransform(cmd) abort
        return join(map(split(a:cmd), 'v:val == "--colors" ? "--colors=always" : v:val'))
      endfunction

      let g:test#custom_transformations = {'phpunit': function('PhpUnitTransform')}
      let g:test#transformation = 'phpunit'

      " let test#php#phpunit#options = '--colors=always'
      let test#php#pest#options = '-v'
      let test#javascript#jest#options = '--color'

      " function! FloatermStrategy(cmd)
      "   execute 'silent FloatermSend q'
      "   sleep 100m
      "   execute 'silent FloatermKill'
      "   execute 'FloatermNew! DISABLE_UPDATE_PROMPT=true '.a:cmd.' | less -X'
      " endfunction
      " let g:test#custom_strategies = {'floaterm': function('FloatermStrategy')}
      " let g:test#strategy = 'floaterm'

      let g:test#strategy = 'neovim_sticky'

      let test#neovim#term_position = "vert"
      let g:test#preserve_screen = 0
      let g:test#neovim_sticky#kill_previous = 1
      let g:test#neovim_sticky#reopen_window = 1
      let g:test#neovim_sticky#use_existing = 1
    ]])
  end
}
