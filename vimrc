"
"                                    ________
"                                  |\\W#####M\
"                                  |M\\W#####M\
"                                  |#M\\W#####M\
"                                  |##M\\W#####M\
"                                  A###M\\W#####M\
"                         _______,a#####M|\W#####M\
"                         \W############W  \W#####M\
"                          \W##########W    \W#####M\
"                           'YW#####W7'      \W#####M\
"                              ¯¯¯¯¯          ¯¯¯¯¯¯¯¯
"
"           Personal .vimrc file of Jess Archer <jess@jessarcher.com>
"

" Init {{{
" ==============================================================================

    " Make sure Vim features are enabled first
    set nocompatible

" }}}

" Plugins {{{

    " vim-plug {{{
    " ==========================================================================

        if empty(glob('~/.vim/autoload/plug.vim'))
            silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
            autocmd VimEnter * PlugInstall | source $MYVIMRC
        endif

        call plug#begin('~/.vim/bundle')

    " }}}

    " ale {{{
    " ==========================================================================

        Plug 'w0rp/ale'
        Plug 'maximbaz/lightline-ale'
        let g:ale_completion_enabled = 1
        let g:ale_set_balloons = 1
        let g:ale_sign_error = '✖'
        let g:ale_sign_warning = '!'

        let g:ale_php_phpcbf_standard = 'PSR2'
        let g:ale_php_phpcs_standard = 'PSR2'
        let g:ale_php_cs_fixer_options = '--fixers PSR2'

        let g:ale_fixers = {'php': ['php_cs_fixer', 'phpcbf']}

        let g:lightline#ale#indicator_checking = "\uf110"
        let g:lightline#ale#indicator_warnings = "\uf071"
        let g:lightline#ale#indicator_errors = "\uf05e"
        let g:lightline#ale#indicator_ok = "\uf00c"

    " }}}

    " ctrlp.vim {{{
    " ==========================================================================

        " Plug 'ctrlpvim/ctrlp.vim'
        " Plug 'tacahiroy/ctrlp-funky'
        " Plug 'nixprime/cpsm', { 'do': 'env PY3=ON ./install.sh' }

        " if executable('fd')
        "     let g:ctrlp_user_command = 'fd --type f --color=never "" %s'
        "     let g:ctrlp_use_caching = 0
        " elseif executable('ag')
        "     let g:ctrlp_user_command = 'ag %s -g "" --hidden --nocolor'
        "     let g:ctrlp_use_caching = 0
        " elseif executable('ack-grep')
        "     let g:ctrlp_user_command = 'ack-grep %s --nocolor -f'
        " elseif executable('ack')
        "     let g:ctrlp_user_command = 'ack %s --nocolor -f'
        " else
        "     let g:ctrlp_user_command = 'find %s -type f'
        " endif

        " let g:ctrlp_match_func = { 'match': 'cpsm#CtrlPMatch' }

        " let g:ctrlp_map = ''

        " let g:ctrlp_funky_matchtype = 'path'
        " let g:ctrlp_funky_syntax_highlight = 1
        " let g:ctrlp_funky_nudists = ['php']

        " nmap <leader>f :CtrlP<CR>
        " nmap <leader>s :CtrlPFunky<CR>
        " nmap <leader>b :CtrlPBuffer<CR>
        " nmap <leader>m :CtrlPMRUFiles<CR>
        " nmap <leader>v :CtrlP vendor<CR>

    " }}}

    " ag.vim  {{{
    " ==========================================================================

        " Plug 'mileszs/ack.vim', { 'on': 'Ack' }

        " " Don't jump to the first result automatically
        " cnoreabbrev Ack Ack!

        " nnoremap <leader>ag :Ack!<space>

        " " Use ag instead of ack
        " if executable('ag')
        "     let g:ackprg = 'ag --vimgrep --smart-case'
        " endif

    " }}}

    " IndexedSearch {{{
    "
    " Shows 'Nth match out of M' at every search
    " ==========================================================================

        Plug 'vim-scripts/IndexedSearch'

    " }}}

    " LargeFile {{{
    "
    " Edit large files quickly
    " ==========================================================================

        let g:LargeFile = 1
        Plug 'vim-scripts/LargeFile'

    " }}}

    " vim-visual-star-search {{{
    "
    " Start a * or # search from a visual block
    " ==========================================================================

        Plug 'nelstrom/vim-visual-star-search'

    " }}}

    " ultisnips {{{
    "
    " The ultimate snippet solution for Vim
    " ==========================================================================

        if has('python')
            Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

            let g:ultisnips_php_scalar_types = 1

            autocmd FileType php UltiSnipsAddFiletypes php-laravel

            " let g:UltiSnipsExpandTrigger       ="<tab>"
            " let g:UltiSnipsJumpForwardTrigger  ="<tab>"
            " let g:UltiSnipsJumpBackwardTrigger ="<s-tab>"
        endif

    " }}}

    " gutentags {{{
    " ==========================================================================

        " Plug 'ludovicchabant/vim-gutentags'
        " " Disable gutentags when working with git as this was triggering an error.
        " " See https://github.com/ludovicchabant/vim-gutentags/issues/178
        " " and https://github.com/ludovicchabant/vim-gutentags/issues/168
        " autocmd FileType gitcommit,gitrebase let g:gutentags_enabled=0

    " }}}

    " tagbar {{{
    " ==========================================================================

        Plug 'majutsushi/tagbar'

        " Open tagbar automatically for supported types
        "autocmd FileType * nested :call tagbar#autoopen(0)

        " Automatically close after jumping to a tag
        let g:tagbar_autoclose = 0

        let g:easytags_async = 1

         " Sort by name rather than order of appearance in the file
        let g:tagbar_sort = 0

        " Show absolute line numbers
        let g:tagbar_show_linenumbers=1

        nmap <leader>tb :TagbarToggle<CR>

    " }}}

    " delimitMate {{{
    "
    " provides insert mode auto-completion for quotes, parens, brackets, etc.
    " ==========================================================================

        " Plug 'Raimondi/delimitMate'

    " }}}

    " pear-tree {{{
    "
    " A Vim auto-pair plugin that supports multi-character pairs, intelligent matching, and more
    " ==========================================================================

        Plug 'tmsvg/pear-tree'

        let g:pear_tree_pairs = {
            \ '(': {'closer': ')'},
            \ '[': {'closer': ']'},
            \ '{': {'closer': '}'},
            \ "'": {'closer': "'"},
            \ '"': {'closer': '"'},
            \ '/\*': {'closer': '\*/'},
            \ '<!--': {'closer': '-->'}
            \ }

        let g:pear_tree_repeatable_expand = 0

        let g:pear_tree_smart_openers = 1
        let g:pear_tree_smart_closers = 1
        let g:pear_tree_smart_backspace = 1

    " }}}

    " vim-fugitive {{{
    "
    " A Git wrapper so awesome, it should be illegal
    " ==========================================================================

        Plug 'tpope/vim-fugitive'
        Plug 'tpope/vim-rhubarb' " Github support
        Plug 'shumphrey/fugitive-gitlab.vim' " Gitlab support

        nmap <leader>gs :Gstatus<cr>
        nmap <leader>gb :Gblame<cr>
        nmap <leader>gcv :Gcommit -v<cr>
        nmap <leader>gca :Gcommit -v --amend<cr>
        nmap <leader>gp :Gpush<cr>

    " }}}

    " vim-gitgutter {{{
    "
    " A Vim plugin which shows a git diff in the gutter (sign column) and
    " stages/reverts hunks.
    " ==========================================================================

        Plug 'airblade/vim-gitgutter'

        set updatetime=100
        let g:gitgutter_max_signs=1000

        nmap <Leader>ga <Plug>GitGutterStageHunk
        nmap <Leader>gu <Plug>GitGutterUndoHunk

    " }}}

    " vim-tmux-navigator {{{
    "
    " Seamless navigation between tmux panes and vim splits
    " ==========================================================================

        Plug 'christoomey/vim-tmux-navigator'

        " seemless moving around between tmux panes and vim splits
        nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
        nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
        nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
        nnoremap <silent> <C-l> :TmuxNavigateRight<cr>

    " }}}

    " vim-tmux-focus-events {{{
    "
     " Make terminal vim and tmux work better together.
    " ==========================================================================

        Plug 'tmux-plugins/vim-tmux-focus-events'

    " }}}

    " vim-commentary {{{
    " ==========================================================================

        Plug 'tpope/vim-commentary'

    " }}}

    " vim-unimpaired {{{
    "
    " Pairs of handy bracket mappings
    " ==========================================================================

        Plug 'tpope/vim-unimpaired'

        autocmd VimEnter * unmap <silent><expr> co

    " }}}

    " vim-vue {{{
    "
    " Syntax highlight for Vue.js components
    " ==========================================================================

        Plug 'posva/vim-vue'

        autocmd FileType vue syntax sync fromstart

    " }}}

    " vim-context-commentstring {{{
    "
    " Vim plugin that sets the value of ‘commentstring’ to a different value
    " depending on the region of the file you are in.
    " ==========================================================================

        Plug 'suy/vim-context-commentstring'

    " }}}

    " vdebug {{{
    "
    " Multi-language DBGP debugger client for Vim
    " ==========================================================================

        Plug 'joonty/vdebug', { 'for': 'php' }

        let g:vdebug_options = {
        \    'server' : '0.0.0.0',
        \    'watch_window_style' : 'expanded',
        \ }

    " }}}

    " vim-json-line-format {{{
    " ==========================================================================

        Plug 'axiaoxin/vim-json-line-format'

    " }}}

    " lightline.vim {{{
    " ==========================================================================

        Plug 'itchyny/lightline.vim'

        let g:lightline = {}

        let g:lightline.fname = ''

        let g:lightline.active = {
            \ 'left': [
                \ [ 'mode', 'paste', 'spell' ],
                \ [ 'fugitive', 'filename' ],
                \ [ 'ctrlpmark' ]
            \ ],
            \ 'right': [
                \ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok', 'lineinfo' ],
                \ [ 'percent' ],
                \ [ 'fileformat', 'fileencoding', 'filetype', 'indent' ]
            \ ]
        \ }

        " let g:lightline.colorscheme = 'wombat' " built-in
        let g:lightline.colorscheme = 'onedark'

        " let g:lightline.component_expand = {
        "     \ 'syntastic': 'SyntasticStatuslineFlag',
        " \ }

        let g:lightline.component_expand = {
            \ 'linter_checking': 'lightline#ale#checking',
            \ 'linter_warnings': 'lightline#ale#warnings',
            \ 'linter_errors': 'lightline#ale#errors',
            \ 'linter_ok': 'lightline#ale#ok',
        \ }

        let g:lightline.component_function = {
            \ 'ctrlpmark': 'CtrlPMark',
            \ 'fileencoding': 'LightLineFileencoding',
            \ 'fileformat': 'LightLineFileformat',
            \ 'filename': 'LightLineFilename',
            \ 'filetype': 'LightLineFiletype',
            \ 'fugitive': 'LightLineFugitive',
            \ 'gutentags': 'LightLineGutentags',
            \ 'mode': 'LightLineMode',
            \ 'indent': 'LightLineIndent'
        \ }

        " let g:lightline.component_type = {
        "     \ 'syntastic': 'error'
        " \ }

        let g:lightline.component_type = {
            \ 'linter_checking': 'left',
            \ 'linter_warnings': 'warning',
            \ 'linter_errors': 'error',
            \ 'linter_ok': 'left',
        \ }

        let g:lightline.separator = { 'left': '', 'right': '' }
        let g:lightline.subseparator = { 'left': '', 'right': '' }


        " let g:lightline = {
        "     \ 'active': {
        "         \ 'left': [
        "             \ [ 'mode', 'paste', 'spell' ],
        "             \ [ 'fugitive', 'filename' ],
        "             \ [ 'ctrlpmark', 'gutentags' ],
        "         \ ],
        "         \ 'right': [
        "             \ [ 'syntastic', 'lineinfo' ],
        "             \ [ 'percent' ],
        "             \ [ 'fileformat', 'fileencoding', 'filetype', 'indent' ],
        "         \ ]
        "     \ },
        "     \ 'colorscheme': 'wombat',
        "     \ 'component_expand': {
        "         \ 'syntastic': 'SyntasticStatuslineFlag',
        "     \ },
        "     \ 'component_function': {
        "         \ 'ctrlpmark': 'CtrlPMark',
        "         \ 'fileencoding': 'LightLineFileencoding',
        "         \ 'fileformat': 'LightLineFileformat',
        "         \ 'filename': 'LightLineFilename',
        "         \ 'filetype': 'LightLineFiletype',
        "         \ 'fugitive': 'LightLineFugitive',
        "         \ 'gutentags': 'LightLineGutentags',
        "         \ 'mode': 'LightLineMode',
        "         \ 'indent': 'LightLineIndent',
        "     \ },
        "     \ 'component_type': {
        "         \ 'syntastic': 'error',
        "     \ },
        "     \ 'separator': { 'left': '', 'right': '' },
        "     \ 'subseparator': { 'left': '', 'right': '' }
        " \ }

        function! CtrlPMark()
            if expand('%:t') =~ 'ControlP' && has_key(g:lightline, 'ctrlp_item')
                call lightline#link('iR'[g:lightline.ctrlp_regex])
                return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item, g:lightline.ctrlp_next], 0)
            else
                return ''
            endif
        endfunction

        let g:ctrlp_status_func = {
            \ 'main': 'CtrlPStatusFunc_1',
            \ 'prog': 'CtrlPStatusFunc_2',
        \ }

        function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
            let g:lightline.ctrlp_regex = a:regex
            let g:lightline.ctrlp_prev = a:prev
            let g:lightline.ctrlp_item = a:item
            let g:lightline.ctrlp_next = a:next
            return lightline#statusline(0)
        endfunction

        function! CtrlPStatusFunc_2(str)
            return lightline#statusline(0)
        endfunction

        function! LightLineMode()
            let fname = expand('%:t')
            return fname =~ '__Tagbar__' ? 'Tagbar' :
                \ fname == 'ControlP' ? 'CtrlP' :
                \ fname == '__Gundo__' ? 'Gundo' :
                \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
                \ fname =~ 'NERD_tree' ? 'NERDTree' :
                \ &ft == 'unite' ? 'Unite' :
                \ &ft == 'vimfiler' ? 'VimFiler' :
                \ &ft == 'vimshell' ? 'VimShell' :
                \ winwidth(0) > 60 ? lightline#mode() : ''
        endfunction

        function! LightLineModified()
            return &ft =~ 'help' ? '' : &modified ? '✎' : &modifiable ? '' : '-'
        endfunction

        function! LightLineReadonly()
            return &ft !~? 'help' && &readonly ? '' : ''
        endfunction

        function! LightLineFilename()
            let fname = expand('%:t')
            return fname == 'ControlP' && has_key(g:lightline, 'ctrlp_item') ? g:lightline.ctrlp_item :
                \ fname =~ '__Tagbar__' ? '' :
                \ fname =~ '__Gundo\|NERD_tree' ? '' :
                \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
                \ &ft == 'unite' ? unite#get_status_string() :
                \ &ft == 'vimshell' ? vimshell#get_status_string() :
                \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
                \ ('' != fname ? fname : '[No Name]') .
                \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
        endfunction

        function! LightLineFileformat()
            return winwidth(0) > 70 ? &fileformat : ''
        endfunction

        function! LightLineFiletype()
            return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
        endfunction

        function! LightLineFugitive()
            try
                if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
                    let mark = ' '  " edit here for cool mark
                    let branch = fugitive#head()
                    return branch !=# '' ? mark.branch : ''
                endif
            catch
            endtry
            return ''
        endfunction

        function! LightLineFileencoding()
          return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
        endfunction

        function! LightLineIndent()
            return winwidth(0) > 70 ? (&expandtab == 1 ? 'spaces[' . &shiftwidth . ']' : 'tabs[' . &tabstop . ']') : ''
        endfunction

        function! LightLineGutentags()
            return gutentags#statusline('Generating tags...')
        endfunction

        let g:tagbar_status_func = 'TagbarStatusFunc'

        function! TagbarStatusFunc(current, sort, fname, ...) abort
            let g:lightline.fname = a:fname
            return lightline#statusline(0)
        endfunction

        " augroup AutoSyntastic
        "     autocmd!
        "     autocmd BufWritePost *.php,*.js call s:syntastic()
        " augroup END

        " function! s:syntastic()
        "     SyntasticCheck
        "     call lightline#update()
        " endfunction

    " }}}

    " ncm2 {{{
    " ==========================================================================

        Plug 'ncm2/ncm2'
        Plug 'roxma/nvim-yarp'

        " enable ncm2 for all buffers
        autocmd BufEnter * call ncm2#enable_for_buffer()

        " IMPORTANTE: :help Ncm2PopupOpen for more information
        set completeopt=noinsert,menuone,noselect

        " NOTE: you need to install completion sources to get completions. Check
        " our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
        Plug 'ncm2/ncm2-bufword'
        Plug 'ncm2/ncm2-tmux'
        Plug 'ncm2/ncm2-path'
        Plug 'phpactor/ncm2-phpactor'
        Plug 'ncm2/ncm2-cssomni'
        Plug 'ncm2/ncm2-tern',  {'do': 'npm install'}
        Plug 'ncm2/ncm2-match-highlight'
        Plug 'ncm2/ncm2-ultisnips'

        " Optional Vimrc Tips

        " suppress the annoying 'match x of y', 'The only match' and 'Pattern not
        " found' messages
        set shortmess+=c

        " CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
        inoremap <c-c> <ESC>

        " Use <TAB> to select the popup menu:
        inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
        inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

        " Plugin settings

        " Press enter key to trigger snippet expansion
        " The parameters are the same as `:help feedkeys()`
        inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')

        " c-j c-k for moving in snippet
        let g:UltiSnipsExpandTrigger		= "<Plug>(ultisnips_expand)"
        let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
        let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
        let g:UltiSnipsRemoveSelectModeMappings = 0

    " }}}

    " pdv {{{
    "
    " PHP Documentor for Vim - Generates PHP docblocks
    " ==========================================================================

        Plug 'tobyS/pdv', { 'for': 'php' } | Plug 'tobyS/vmustache'

        let g:pdv_template_dir = $HOME . "/.vim/bundle/pdv/templates_snip"

        nmap <leader>pd :call pdv#DocumentWithSnip()<cr>

    " }}}

    " phpactor {{{
    " ==========================================================================

        Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}

        " The FileType autocmd doesn't trigger properly because phpactor is lazy-loaded,
        " so it needs to be triggered via the User event.
        autocmd! User phpactor autocmd FileType php setlocal omnifunc=phpactor#Complete

        let g:phpactorOmniError = v:true

        " Include use statement
        nmap <Leader>u :call phpactor#UseAdd()<CR>

        " Invoke the context menu
        nmap <Leader>mm :call phpactor#ContextMenu()<CR>

        " Invoke the navigation menu
        nmap <Leader>nn :call phpactor#Navigate()<CR>

        " Goto definition of class or class member under the cursor
        nmap <Leader>o :call phpactor#GotoDefinition()<CR>

        " Transform the classes in the current file
        nmap <Leader>tt :call phpactor#Transform()<CR>

        " Generate a new class (replacing the current file)
        nmap <Leader>cc :call phpactor#ClassNew()<CR>

        " Extract expression (normal mode)
        nmap <silent><Leader>ee :call phpactor#ExtractExpression(v:false)<CR>

        " Extract expression from selection
        vmap <silent><Leader>ee :<C-U>call phpactor#ExtractExpression(v:true)<CR>

        " Extract method from selection
        vmap <silent><Leader>em :<C-U>call phpactor#ExtractMethod()<CR>

    " }}}

    " php.vim {{{
    "
    " Up-to-date PHP syntax file
    " ==========================================================================

        Plug 'StanAngeloff/php.vim'

        function! PhpSyntaxOverride()
            hi! def link phpDocTags  phpDefine
            hi! def link phpDocParam phpType
        endfunction

        augroup phpSyntaxOverride
            autocmd!
        "    autocmd FileType php call PhpSyntaxOverride()
        augroup END

    " }}}

    " phpcomplete.vim {{{
    "
    " Improved PHP omni-completion
    " ==========================================================================

        "Plug 'shawncplus/phpcomplete.vim', { 'for': 'php' }

        "let g:phpcomplete_parse_docblock_comments = 0

    " }}}

    " PHP-Indenting-for-VIm {{{
    "
    " The official VIm indent script for PHP
    " ==========================================================================

        Plug '2072/PHP-Indenting-for-VIm'

    " }}}

    " html5.vim {{{
    "
    " HTML5 omnicomplete and syntax
    " ==========================================================================

        Plug 'othree/html5.vim'

    " }}}

    " emmet-vim {{{
    " ==========================================================================

        Plug 'mattn/emmet-vim'

    " }}}

    " scss-syntax.vim {{{
    " ==========================================================================

        Plug 'cakebaker/scss-syntax.vim'

    " }}}

    " vim-css3-syntax {{{
    "
    " Add CSS3 syntax support to vim's built-in `syntax/css.vim`.
    " ==========================================================================

        Plug 'hail2u/vim-css3-syntax'

    " }}}

    " vim-blade {{{
    "
    " Syntax highlighting for Blade templates
    " ==========================================================================

        Plug 'jwalton512/vim-blade'

    " }}}

    " vim-javascript {{{
    "
    " Vastly improved Javascript indentation and syntax support
    " ==========================================================================

        Plug 'pangloss/vim-javascript'

    " }}}

    " vim-mustache-handlebars {{{
    "
    " Mustache and handlebars mode for vim
    " ==========================================================================

        Plug 'mustache/vim-mustache-handlebars'

    " }}}

    " splitjoin.vim {{{
    "
    " Simplifies the transition between multiline and single-line code
    " ==========================================================================

        Plug 'AndrewRadev/splitjoin.vim'

    " }}}

    " vim-repeat {{{
    "
    " Enable repeating supported plugin maps with .
    " ==========================================================================

        Plug 'tpope/vim-repeat'

    " }}}

    " vim-surround {{{
    "
    " Quoting/parenthesizing made simple
    " ==========================================================================

        Plug 'tpope/vim-surround'

    " }}}

    " vim-lion {{{
    "
    " Alignment by characters
    " ==========================================================================

        Plug 'tommcdo/vim-lion'

        " Remove as many spaces as possible when aligning
        let g:lion_squeeze_spaces = 1

    " }}}

    " indentLine {{{
    "
    " A vim plugin to display the indention levels with thin vertical lines
    " ==========================================================================

        " Plug 'Yggdroot/indentLine'

        " " let g:indentline_faster = 1
        " " let g:indentline_char = '┊'
        " " let g:indentline_first_char = '┊'
        " let g:indentline_char = '│'
        " let g:indentline_first_char = '│'
        " let g:indentline_color_term = 237
        " let g:indentline_showfirstindentlevel = 1

    " }}}

    " vim-bbye {{{
    "
    " Delete buffers and close files in Vim without closing your windows or
    " messing up your layout.
    " ==========================================================================

        Plug 'moll/vim-bbye'

    " }}}

    " vim-hardtime {{{
    "
    " Plugin to help you stop repeating the basic movement key
    " ==========================================================================

        Plug 'takac/vim-hardtime'

        let g:hardtime_default_on = 0
        let g:hardtime_showmsg = 1
        let g:hardtime_allow_different_key = 1
        let g:hardtime_maxcount = 4

    " }}}

    " vim-smoothscroll {{{
    " ==========================================================================

        Plug 'terryma/vim-smooth-scroll'

        noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 4)<CR>
        noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 4)<CR>
        noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 8)<CR>
        noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 8)<CR>

    " }}}

    " vim-php-manual {{{
    " ==========================================================================

        " let g:php_manual_online_search_shortcut = "<s-P>"

    " }}}

    " localvimrc {{{
    " ==========================================================================

        Plug 'embear/vim-localvimrc'
        let g:localvimrc_persistent = 2

    " }}}

    " ZoomWin {{{
    " ==========================================================================

        "nmap <leader>z :ZoomWin<CR>

    " }}}

    " NERDTree {{{
    " ==========================================================================

        Plug 'scrooloose/nerdtree'

        let NERDTreeShowHidden=1
        let NERDTreeMinimalUI=1

        " Open NERDTree automatically when vim starts up and no files were specified
        "autocmd StdinReadPre * let s:std_in=1
        "autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | wincmd p | endif
        "autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

        " Close vim automatically if the only window left open is a NERDTree
        "autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

        nmap <leader>n :NERDTreeToggle<CR>

    " }}}

    " nerdtree-git-plugin {{{
    " ==========================================================================

        Plug 'Xuyuanp/nerdtree-git-plugin'

    " }}}

    " vim-devicons {{{
    " ==========================================================================

        Plug 'ryanoasis/vim-devicons'
        Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

        let g:WebDevIconsUnicodeDecorateFolderNodes = 1
        let g:DevIconsEnableFoldersOpenClose = 1
        let g:DevIconsEnableFolderExtensionPatternMatching = 1

    " }}}

    " apiblueprint.vim {{{
    " ==========================================================================

        Plug 'kylef/apiblueprint.vim'

    " }}}

    " vim-argwrap {{{
    " ==========================================================================

        Plug 'FooSoft/vim-argwrap'

        " let g:argwrap_tail_comma = 1
        let g:argwrap_tail_comma_braces = '['
        nnoremap <silent> <leader>aw :ArgWrap<CR>

    " }}}

    " vim-wintabs {{{
    " ==========================================================================

"         Plug 'zefei/vim-wintabs'
"         Plug 'zefei/vim-wintabs-powerline'

"         let g:wintabs_ui_buffer_name_format = ' %n %t '

"         map <C-n> :WintabsNext<CR>
"         map <C-p> :WintabsPrev<CR>

    " }}}

    " vim-pasta {{{
    " ==========================================================================

        Plug 'sickill/vim-pasta'

    " }}}

    " vim-json {{{
    " ==========================================================================

        Plug 'elzr/vim-json'
        let g:vim_json_syntax_conceal = 0

    " }}}

    " onedark.vim {{{
    " ==========================================================================

        Plug 'joshdick/onedark.vim'

    " }}}

    " editorconfig {{{
    " ==========================================================================

        Plug 'editorconfig/editorconfig-vim'

        " Ensure that this plugin works well with Tim Pope's fugitive
        let g:EditorConfig_exclude_patterns = ['fugitive://.*']

    " }}}

    " highlightedyank {{{
    "
    " Make the yanked region apparent
    " ==========================================================================

    Plug 'machakann/vim-highlightedyank'

    " }}}

    " emmet {{{
    " ==========================================================================

    Plug 'mattn/emmet-vim'

    " }}}

    " fzf {{{
    " ==========================================================================

        Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
        Plug 'junegunn/fzf.vim'

        nmap <leader>f :GFiles --cached --others --exclude-standard<CR>
        nmap <leader>F :Files<CR>
        nmap <leader>b :Buffers<CR>
        nmap <leader>h :History<CR>
        nmap <leader>t :BTags<CR>
        nmap <leader>l :BLines<CR>
        nmap <leader>L :Lines<CR>
        nmap <leader>' :Marks<CR>
        nmap <leader>ag :Ag<space>
        nmap <leader>H :Helptags!<space>
        nmap <leader>C :Commands<space>
        nmap <leader>: :History:<space>
        nmap <leader>/ :History/<space>
        nmap <leader>M :Maps<space>
        nmap <leader>M :Maps<space>

    " }}}

    " vim-test {{{
    " ==========================================================================

        Plug 'janko-m/vim-test'

        function! DockerTransform(cmd) abort
            return 'docker-compose exec app '.a:cmd
        endfunction

        let g:test#custom_transformations = {'docker': function('DockerTransform')}
        let g:test#transformation = 'docker'

    " }}}

    call plug#end()
" }}}

" General Settings {{{
" ==============================================================================

    " Show line number(s)
    set number

    " Show line numbers relative to the current line
    if exists('+relativenumber')
        set relativenumber
    endif

    " Store lots of :cmdline history
    set history=500

    " Reload files changed outside of vim
    set autoread

    " Replace annoying error bell with annoying screen flash
    set visualbell

    " Make the visual bell do nothing (so it's not annoying)
    set t_vb=

    " Set term title
    set title

    " Get rid of the pesky 'Thanks for flying Vim' title on exit
    let &titleold=''

    " Tab bar display setting: 0: never, 1: only when >1 tabs, 2: always
    set showtabline=1

    " Show commands as they are being typed (e.g. 2dd), also the number of lines
    " or the dimensions in Visual selection modes
    set showcmd

    " Show a column at textwidth+1 chars as the boundary of textwidth
    if exists('+colorcolumn')
        set colorcolumn=+1,81,121
    endif

    " don't display lines wrapped by default
    set nowrap

    " When wrapping, break at end of word rather than mid-word
    set linebreak

    " Show line and column numbers (only useful when statusbar not enabled)"
    set ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)

    " Restore previous buffers when starting
    set viminfo+=%

    " Always show the sign column so things don't jump around when it appears
    set signcolumn=yes

    set display=lastline
    set encoding=utf-8
    set laststatus=2
    set showmatch

" }}}

" Moving Around {{{
" ==============================================================================

    " Enable use of mouse in all modes with a supported terminal"
    set mouse=a

    " Highlight the line that the cursor is on
    " set cursorline

    " Start vertically scrolling when 3 lines from the top or bottom
    set scrolloff=3

    " Start horizontally scrolling when 3 lines from the edges
    set sidescrolloff=3

    " How many columns to scroll at a time horizontally
    set sidescroll=1

    " Don't reset cursor to start of line when moving around
    set nostartofline

" }}}

" Text Editing and Formatting {{{
" ==============================================================================

    " Allow full backspace in insert mode
    set backspace=indent,eol,start

    " Width of text before breaking
    set textwidth=80

    " Only insert single space after '.', '?', and '!' when joining
    set nojoinspaces

    " Treat strings starting with '0' as numbers for the purposes of incrementing
    set nrformats-=octal

    " Reset formatoptions
    set formatoptions=

    " Format comments
    set formatoptions+=c

    " Continue comments onto next line
    set formatoptions+=r

    " Format comments with gq
    set formatoptions+=q

    " Recognize numbered lists
    set formatoptions+=n

    " Use indent from 2nd line of a paragraph
    set formatoptions+=2

    " Don't break lines that are already long
    set formatoptions+=l

    " Break before 1-letter words
    set formatoptions+=1

    " Delete comment character when joining commented lines
    if v:version > 703 || v:version == 703 && has("patch541")
        set formatoptions+=j
    endif

    " Don't comment newline when using o or O from a commented line (needs
    " autocmd otherwise it gets overwritten)
    autocmd FileType * setlocal formatoptions-=o

" }}}

" Tabs & Indentation {{{
" ==============================================================================

    " Use spaces instead of tabs
    set expandtab

    " How many characters wide the tab character should be
    set tabstop=4

    " How many spaces to use instead of a tab
    set shiftwidth=4

    " Intelligently backspace the right number of space characters
    set smarttab

    " Copy indent level from previous line when starting a new line
    set autoindent

    " Seems to automatically update the indentation when a closing paren is
    " typed
    set smartindent

    " Copy whatever characters were used to indent the previous line
    set copyindent

    " Preserve as much of the existing indentation characters when changing
    " indentation level
    set preserveindent

    " display tabs, tailing spaces, and other chars visually
    set list

    set listchars=tab:▸\ ,space:·,trail:·,extends:→,precedes:←,nbsp:␣,eol:↲
    set fillchars+=vert:│
    set showbreak=↪\

" }}}

" Searching {{{
" ==============================================================================

    " Highlight search matches
    set hlsearch

    " Start searching while typing
    set incsearch

    " Show what substitutions will look like real-time
    set inccommand=split

    " Enable regex for searches
    set magic

    " Case insensitive searches...
    set ignorecase

    " ...unless specifically searching for something with uppercase characters
    set smartcase

" }}}

" Copy and Paste {{{
" ==============================================================================

    " use the system clipboard
    set clipboard^=unnamed,unnamedplus

    " Use xclip for copy/paste
    vmap "+y :!xclip -f -sel clip
    map  "+p :r!xclip -o -sel clip

    " Leave paste mode when leaving insert mode
    augroup copypaste
        autocmd!
        autocmd InsertLeave * set nopaste
    augroup end

" }}}

" Completion {{{
" ==============================================================================

    " Command mode completetion
    set wildmenu

    " Only complete the longest common part of the text, and show the wildmenu
    " if enabled. If tab is pressed again, it will cycle through the options.
    set wildmode=list:longest,full

    " Insert mode completion - only complete the longest common part of the text
    " set completeopt=longest,menu,preview

" }}}

" Keymapping {{{
" ==============================================================================

    " n - Normal
    " v - Visual and Select
    " s - Select
    " x - Visual
    " o - Operator-pending
    " i - Insert
    " l - Insert, Command-line, Lang-Arg
    " c - Command-line
    " None - Normal, Visual, Select, Operator-pending
    "
    " [nvsxoilc]noremap - Don't recursively map if recursive mapping is on (default)
    " [nvsxoilc]map
    " [nvsxoilc]unmap
    " [nvsxoilc]mapclea

    " Quickly edit our .vimrc file
    nmap <leader>ve :e ~/.vimrc<cr>

    " Use the default leader
    let mapleader = "\\"
    let g:mapleader = "\\"

    " Map space to be a leader key as well (so that showcmd works for space)
    map <Space> <Leader>

    " Quicky escape to normal mode
    imap jj <esc>

    nmap <leader>w :w<cr>

    nmap <leader>q :Bdelete<CR>

    " Auto change directory to match current file ,cd
    nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

    "nmap <leader>l :setlocal number!<CR>:setlocal list!<CR>:silent! GitGutterToggle<CR>:silent! setlocal relativenumber!<CR>:silent! IndentLinesToggle<CR>

    "nmap <leader>c :!ctags --recurse --totals .<CR>

    " Open the current file in the default program
    nmap <leader>x :!xdg-open %<cr><cr>

    " Run PHPUnit tests
    map <leader>pu :!phpunit %<cr>

    " Artisan shortcuts
    abbrev amod !php artisan make:model
    abbrev amig !php artisan make:migration
    abbrev ajob !php artisan make:job

    " Switch between the last two files
    nmap <leader><leader> <c-^>

    " Create/edit file in the current directory
    nmap :ed :edit %:p:h/

    " Make vim act a bit more like readline
    cnoremap <C-a>  <Home>
    cnoremap <C-b>  <Left>
    cnoremap <C-f>  <Right>
    cnoremap <C-d>  <Delete>
    cnoremap <M-b>  <S-Left>
    cnoremap <M-f>  <S-Right>
    cnoremap <M-d>  <S-right><Delete>
    cnoremap <Esc>b <S-Left>
    cnoremap <Esc>f <S-Right>
    cnoremap <Esc>d <S-right><Delete>
    cnoremap <C-g>  <C-c>

    noremap Y y$

    " Maintain the cursor position when yanking a visual selection
    " http://ddrscott.github.io/blog/2016/yank-without-jank/
    vnoremap y myy`y
    vnoremap Y myY`y

    " Reselect visual selection after indenting
    vnoremap < <gv

    " Reselect visual selection after de-indenting
    vnoremap > >gv

    " Clear search highlighting
    nnoremap <silent> <leader>k :nohl<CR>

    " Visually select last pasted text using same visual mode
    nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

    " When text is wrapped, move by terminal rows, not lines, unless a count is
    " provided
    noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
    noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

    cmap w!! %!sudo tee > /dev/null %

    " Stop the annoying command history popup from typo
    map q: :q

    nmap c* *Ncgn

    " In command mode (i.e. after pressing ':'), expand %% to the path of the
    " current buffer. This allows you to easily open files from the same
    " directory as the currently opened file.
    cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

    " Allows you to easily replace the current word and all its occurrences.
    nnoremap <Leader>rc :%s/\<<C-r><C-w>\>/
    vnoremap <Leader>rc y:%s/<C-r>"/

    " Allows you to easily change the current word and all occurrences to
    " something else. The difference between this and the previous mapping is
    " that the mapping below pre-fills the current word for you to change.
    nnoremap <Leader>cc :%s/\<<C-r><C-w>\>/<C-r><C-w>
    vnoremap <Leader>cc y:%s/<C-r>"/<C-r>"

" }}}

" Spell Checking {{{
" ==============================================================================

    " Enable spell checking
    set spell

    " Self-explanatory
    set spelllang=en_au

" }}}

" Colors {{{
" ==============================================================================

    " Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
    " If you're using tmux version 2.2 or later, you can remove the outermost
    " $TMUX check and use tmux's 24-bit color support.
    " See http://sunaku.github.io/tmux-24bit-color.html#usage for more
    " information.
    if (empty($TMUX))
        if (has("nvim"))
            " For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
            let $NVIM_TUI_ENABLE_TRUE_COLOR=1
        endif

        " For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
        " Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
        " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
        if (has("termguicolors"))
            set termguicolors
        endif
    endif

    syntax on
    "set background=dark


    "augroup colorschemeoverrides
    "     autocmd!
    "     " autocmd ColorScheme * highlight Search     ctermbg=19  ctermfg=NONE
    "     autocmd ColorScheme * highlight SpecialKey ctermfg=237
    "     autocmd ColorScheme * highlight NonText    ctermfg=237
    "     autocmd ColorScheme * highlight MatchParen ctermbg=240 ctermfg=NONE

    "     autocmd ColorScheme * highlight SpellBad cterm=underline ctermbg=NONE
    "     autocmd ColorScheme * highlight SpellLocal cterm=underline ctermbg=NONE
    "     autocmd ColorScheme * highlight SpellRare cterm=underline ctermbg=NONE
    "     autocmd ColorScheme * highlight SpellCap cterm=underline ctermbg=NONE
    "augroup end

    augroup HighlightWhitespace
        autocmd!
        autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
        autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
        autocmd InsertLeave * match ExtraWhitespace /\s\+$/
    augroup end

    " if !empty(glob('~/.vim/bundle/base16-vim/')) && filereadable(expand("~/.vimrc_background")) && ($BASE16_THEME != '' || has("gui_running"))
    "     let base16colorspace=256  " Access colors present in 256 colorspace
    "     source ~/.vimrc_background
    " else
    "     colorscheme default
    " endif

    augroup onedarkextend
        autocmd!
        " Make non text characters (like listchars) barely visible
        autocmd ColorScheme * call onedark#extend_highlight("NonText", { "fg": { "cterm": 237 } })

        " Don't give spelling errors a special colour
        autocmd ColorScheme * call onedark#extend_highlight("SpellBad", { "fg": { "cterm": "NONE" } })
        autocmd ColorScheme * call onedark#extend_highlight("SpellLocal", { "fg": { "cterm": "NONE" } })
        autocmd ColorScheme * call onedark#extend_highlight("SpellRare", { "fg": { "cterm": "NONE" } })
        autocmd ColorScheme * call onedark#extend_highlight("SpellCap", { "fg": { "cterm": "NONE" } })
    augroup end

    let g:onedark_terminal_italics = 1
    colorscheme onedark

" }}}

" Buffers {{{
" ==============================================================================

    " Allow unwritten buffers in the background
    set hidden

    " Move between buffers like tabs
    " nmap <C-n> :bnext<CR>
    " nmap <C-p> :bprev<CR>

" }}}

" Splits {{{
" ==============================================================================

    " Open new split below rather than above
    set splitbelow

    " Open new vertical split to the right, rather than left
    set splitright

" }}}

" File Browsing {{{
" ==============================================================================

    " Search in all subdirectories
    set path+=**

    " Tree view
    let g:netrw_liststyle = 3

    " Disable the banner
    let g:netrw_banner = 0

    " Force netrw to open links directly in firefox rather than using xdg-open
    " and friends. This fixes an issue where xdg-open and friends will redirect
    " to the login screen for URLs where a session exists in Firefox.
    let g:netrw_browsex_viewer = "firefox"

" }}}

" Filetype Overrides {{{
" ==============================================================================

    augroup filetypeoverrides
        autocmd!

        " Give JSON files JavaScript highlighting
        au BufRead,BufNewFile *.json set ft=json syntax=javascript

        " Format Mutt temp files as email
        au BufRead,BufNewFile *tmp/mutt* set ft=mail

        " Don't backup gopass temp files
        au BufNewFile,BufRead /dev/shm/gopass.* setlocal noswapfile nobackup noundofile
    augroup end

" }}}

" Programming-specific {{{
" ==============================================================================

    " Look for tags files in parent directories
    "if has('path_extra')
    "    setglobal tags-=./tags tags-=./tags; tags^=./tags;,./vendor-tags;
    "endif

" }}}

" General Auto-commands {{{
" ==============================================================================

    augroup generalautocommands
        autocmd!

        " Return to last edit position when opening files
        autocmd BufReadPost * call setpos(".", getpos("'\""))

        " Automatically re-source the .vimrc on save
        autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw

        " Add a variation for when we edit the .vimrc while using neovim where
        " $MYVIMRC is set to init.vim
        autocmd! BufWritePost .vimrc source % | echom "Reloaded " . $MYVIMRC | redraw

        autocmd FileType php setlocal commentstring=//%s
    augroup end

" }}}

" Speed Improvements {{{
" ==============================================================================

    " Seems to fix scrolling issues caused by relativenumber and cursorline
    set lazyredraw

    set ttyfast
    " syntax sync minlines=200
    " syntax sync maxlines=240
    set synmaxcol=210 " Prevent vim from processing syntax on really long lines

" }}}

" Backups {{{
" ==============================================================================

    if !isdirectory($HOME . '/.vim/backups')
        call mkdir($HOME . '/.vim/backups', 'p')
    endif

    set backupdir=~/.vim/backups
    set backup

" }}}

" Swap Files {{{
" ==============================================================================

    if !isdirectory($HOME . '/.vim/swaps')
        call mkdir($HOME . '/.vim/swaps', 'p')
    endif

    set directory=~/.vim/swaps

" }}}

" Undo {{{
" ==============================================================================

    if has('persistent_undo')

        if !isdirectory($HOME . '/.vim/undo')
            call mkdir($HOME . '/.vim/undo', 'p')
        endif

        set undodir=~/.vim/undo
        set undofile
        set undolevels=1000
        set undoreload=10000

    endif

" }}}

" Local overrides {{{
" ==============================================================================

    let $LOCALFILE=expand("~/.vimrc_local")

    if filereadable($LOCALFILE)
        source $LOCALFILE
    endif

" }}}

" vim: set nospell foldmethod=marker foldlevel=0:
