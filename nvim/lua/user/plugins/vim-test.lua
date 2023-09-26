return {
  'vim-test/vim-test',
  keys = {
    { '<Leader>tn', ':TestNearest<CR>' },
    { '<Leader>tf', ':TestFile<CR>' },
    { '<Leader>ts', ':TestSuite<CR>' },
    { '<Leader>tl', ':TestLast<CR>' },
    { '<Leader>tv', ':TestVisit<CR>' },
  },
  dependencies = { 'voldikss/vim-floaterm' },
  config = function()
    vim.cmd([[
      let test#php#phpunit#options = '--colors=always'
      let test#php#pest#options = '--colors=always'

      function! FloatermStrategy(cmd)
        execute 'silent FloatermSend q'
        execute 'silent FloatermKill'
        execute 'FloatermNew! '.a:cmd.' |less -X'
      endfunction

      let g:test#custom_strategies = {'floaterm': function('FloatermStrategy')}
      let g:test#strategy = 'floaterm'
    ]])
  end
}
