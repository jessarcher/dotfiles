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

"===============================================================================
" Init
"===============================================================================

" Make sure Vim features are enabled first
set nocompatible

" Load bundles
let b:bundles_loaded = 0
if filereadable(expand("~/.vimrc.bundles"))
    source ~/.vimrc.bundles
    let b:bundles_loaded = 1
endif

"===============================================================================
" General Settings
"===============================================================================

set number                     " show line number(s)
if exists('+relativenumber')
    set relativenumber         " show line numbers relative to the current line
endif
set history=1000               " store lots of :cmdline history
set backspace=indent,eol,start " allow full backspace in insert mode
set autoread                   " reload files changed outside of vim
set noerrorbells               " disable annoying bell
set novisualbell               " disable annoying visual bell
set ruler                      " show line and column numbers (only useful when statusbar not enabled)"
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
let &titleold=''               " get rid of the pesky 'Thanks for flying Vim' title on exit
set title                      " set term title
set lazyredraw                 " seems to fix scrolling issues caused by relativenumber and cursorline"
set mouse=a                    " enable use of mouse in all modes with a supported terminal"
set nostartofline              " don't reset cursor to start of line when moving around
set clipboard^=unnamed,unnamedplus " use the system clipboard
set showtabline=1              " tab bar display setting: 0: never, 1: only when >1 tabs, 2: always"
set showcmd                    " show commands as they are being typed (e.g. 2dd), also the number of lines or the dimensions in Visual selection modes"
set encoding=utf8 nobomb       " utf-8 of course
set nojoinspaces               " only insert single space after '.', '?', and '!' when joining
set fileformats=unix,dos,mac
set fileformat=unix
set hidden
set spell                      " enable spell checking
set spelllang=en_au            " self-explanatory
set textwidth=80               " width of text before breaking
if exists('+colorcolumn')
    set colorcolumn=+1         " show a column at textwidth+1 chars as the boundary of textwidth
endif
set cursorline                 " highlight the line that the cursor is on
set nocursorcolumn             " don't highlight the column the cursor is on
set viewoptions=folds,options,cursor,unix,slash
set scrolloff=7                " start vertically scrolling when 7 lines from the top or bottom
set sidescrolloff=3            " start horizontally scrolling when 3 lines from the edges
set sidescroll=1               " how many columns to scroll at a time horizontally
set splitbelow                 " Open new split below rather than above
set splitright                 " Open new vertical split to the right, rather than left

"===============================================================================
" Text Formatting
"===============================================================================

set formatoptions+=c           " format comments
set formatoptions+=r           " continue comments onto next line
set formatoptions+=q           " format comments with gq
set formatoptions+=n           " recognize numbered lists
set formatoptions+=2           " use indent from 2nd line of a paragraph
set formatoptions+=l           " don't break lines that are already long
set formatoptions+=1           " break before 1-letter words
silent! set formatoptions+=j   " delete comment character when joining commented lines
autocmd FileType * setlocal formatoptions-=o " don't comment newline when using o or O from a commented line (needs autocmd otherwise it gets overwritten)

"===============================================================================
" Searching
"===============================================================================

set hlsearch                   " highlight search matches
set incsearch                  " start searching while typing
set magic                      " enable regex for searches
set ignorecase                 " case insensitive searches
set smartcase                  " unless specifically searching for something with uppercase characters

"===============================================================================
" Paths
"===============================================================================

if !isdirectory($HOME . '/.vim/backups')
    call mkdir($HOME . '/.vim/backups', 'p')
endif
set backupdir=~/.vim/backups
set backup

if !isdirectory($HOME . '/.vim/swaps')
    call mkdir($HOME . '/.vim/swaps', 'p')
endif
set directory=~/.vim/swaps

if has('persistent_undo')
    if !isdirectory($HOME . '/.vim/undo')
        call mkdir($HOME . '/.vim/undo', 'p')
    endif
    set undodir=~/.vim/undo
    set undofile
    set undolevels=1000
    set undoreload=10000
endif

" Look for tags files in parent directories
set tags+=tags;/

"===============================================================================
" Indentation & Tabs
"===============================================================================

set autoindent
"set smartindent   " Smart indenting based on curly brackets and cinwords
"set copyindent
"set preserveindent


set smarttab
"set expandtab     " expand tabs to spaces
"set tabstop=4     " number of spaces that a <Tab> in the file counts for
"set shiftwidth=4  " number of spaces to use for each step of (auto)indent
"set softtabstop=0 " number of spaces that a <Tab> counts for while performing editing operations

set list          " display tabs, tailing spaces, and other chars visually
"set listchars=tab:▸\ ,trail:·,eol:¬,extends:>,precedes:<,nbsp:_
set listchars=tab:▸\ ,trail:·,extends:>,precedes:<,nbsp:_

set nowrap        " don't wrap lines
set linebreak     " wrap lines at convenient points

set showmatch     " show matching bracket
set matchtime=3   " how long to showmatch for

"===============================================================================
" Completion
"===============================================================================

set wildmenu                "Enable ^n and ^p to scroll through matches
set wildmode=list:longest
" set wildchar=<TAB>
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

set omnifunc=syntaxcomplete#Complete " Default Omnicompletion
autocmd FileType php        setlocal omnifunc=phpcomplete#CompletePHP
"autocmd FileType css        setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html       setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType markdown   setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python     setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml        setlocal omnifunc=xmlcomplete#CompleteTags

set completeopt+=menu    " Popup menu
set completeopt+=menuone " Popup menu even when only one match
set completeopt+=longest " Only insert the longest common text for all matches
"set completeopt-=preview " The scratch window when auto-completing

" Completion sources and order
set complete=.       " current buffer
set complete+=w      " buffers from other windows
set complete+=b      " other loaded buffers
set complete+=u      " unloaded buffers
set complete+=t      " tags
set complete+=i      " file includes
set complete+=kspell " dictionary (when spell is on)

"inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
"inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
"inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
"inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
"inoremap <expr> <C-d>      pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
"inoremap <expr> <C-u>      pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"

" Automatically open and close the popup menu / preview window
"au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

" Highlight all references to the keyword currently under the cursor
"autocmd CursorMoved * exe printf('match NonText /\V\<%s\>/', escape(expand('<cword>'), '/\'))


"===============================================================================
" Keymapping
"===============================================================================

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

" Unbind arrow keys to develop better habits.
noremap  <Up>     <NOP>
noremap  <Down>   <NOP>
noremap  <Left>   <NOP>
noremap  <Right>  <NOP>
inoremap <Up>     <NOP>
inoremap <Down>   <NOP>
inoremap <Left>   <NOP>
inoremap <Right>  <NOP>

" Get out of the habit of closing Vim!
" map :q<CR>   :echo 'stop quitting'<CR>
" map :q!<CR>  :echo 'stop quitting'<CR>
" map :wq<CR>  :w<CR>:echo 'stop quitting (I still wrote your file)'<CR>
" map :wq!<CR> :w<CR>:echo 'stop quitting (I still wrote your file)'<CR>

vnoremap < <gv " Reselect visual selection after indenting
vnoremap > >gv " Reselect visual selection after de-indenting

" Toggle line numbers, list, and gitgutter
nmap <leader>l :setlocal number!<CR>:setlocal list!<CR>:silent! GitGutterToggle<CR>:silent! setlocal relativenumber!<CR>

" Toggle paste
nmap <leader>o :set paste!<CR>

" Leave paste mode when leaving insert mode
autocmd InsertLeave * set nopaste

" Move by terminal rows, not lines
nmap j gj
nmap k gk

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

" Move between buffers like tabs
map <C-n> :bnext<CR>
map <C-p> :bprev<CR>

" nnoremap ; :

" Switch between the last two files
nnoremap <leader><leader> <c-^>


" Use xclip for copy/paste
vmap "+y :!xclip -f -sel clip
map  "+p :r!xclip -o -sel clip

" Stop the annoying command history popup from typo
map q: :q

" https://stackoverflow.com/questions/1444322/how-can-i-close-a-buffer-without-closing-the-window
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

" Use sudo to write the file
cmap w!! w !sudo tee % >/dev/null

" Map <Leader>ff to display all lines with keyword under cursor and ask which one to jump to
nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>


"===============================================================================
" Whitespace
"===============================================================================

"autocmd BufWinEnter *.php,*.js,*.html,*.css,*.scss let w:m1=matchadd('TabWhitespace',          '[^\t]\zs\t\+', -1)
"autocmd BufWinEnter *.php,*.js,*.html,*.css,*.scss let w:m2=matchadd('SpaceIndent',            '^\t*\zs \+',   -1)
"autocmd BufWinEnter *.php,*.js,*.html,*.css,*.scss let w:m4=matchadd('TrailingWhitespace',     '\s\+$',        -1)
"autocmd BufWinEnter *.php,*.js,*.html,*.css,*.scss let w:m3=matchadd('DoubleSpaceAfterPeriod', '\.\s\s\+',     -1)

" autocmd BufWritePre * :RetabIndents
"command! RetabIndents call RetabIndents()

"func! RetabIndents()
"   let saved_view = winsaveview()
"   execute '%s@^\(\ \{'.&ts.'\}\)\+@\=repeat("\t", len(submatch(0))/'.&ts.')@e'
"   call winrestview(saved_view)
"endfunc

"===============================================================================
" Plugin Config
"===============================================================================

if b:bundles_loaded == 1

    " airline
    if isdirectory(expand("~/.vim/bundle/vim-airline"))

        set laststatus=2 " Show status line for all windows
        set noshowmode   " Remove duplicate mode indicator
        "set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ Col:\ %c

        let g:airline_powerline_fonts = 1

        "let g:airline_theme='jess'
        let g:airline_theme='tomorrowjess'

        " Enable the list of tabs
        " Automatically displays all buffers when there's only one tab open.
        let g:airline#extensions#tabline#enabled = 1

        " Show just the filename
        let g:airline#extensions#tabline#fnamemod = ':t'

        let g:airline#extensions#tabline#buffer_nr_show = 1

        let g:airline#extensions#whitespace#enabled = 1
        let g:airline#extensions#whitespace#mixed_indent_algo = 0
        let g:airline#extensions#whitespace#symbol = '!'
        let g:airline#extensions#whitespace#checks = [ 'indent', 'trailing' ]
        let g:airline#extensions#whitespace#show_message = 1

    endif

    " PDV
    if isdirectory(expand("~/.vim/bundle/pdv"))
        let g:pdv_template_dir = $HOME . "/.vim/bundle/pdv/templates_snip"
        nnoremap <leader>d :call pdv#DocumentWithSnip()<cr>
    endif

    " SuperTab
    if isdirectory(expand("~/.vim/bundle/supertab"))
        let g:SuperTabDefaultCompletionType = "context"
        let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
        let g:SuperTabClosePreviewOnPopupClose = 1
    endif

    " CtrlP
    if isdirectory(expand("~/.vim/bundle/ctrlp.vim"))

        let g:ctrlp_custom_ignore = {
            \ 'dir':  '\.git$\|\.hg$\|\.svn$',
            \ 'file': '\v\.(exe|so|dll|class|aux|pdf|jpg|png|gif|bmp|swf|zip|doc|docx|xls|xlsx|indd|ai|eps|dmg|rtf|numbers|pages|tiff|ods|iso|ppt|pptx|sparseimage|mp3|mp4|wav)$',
            \ }
        if executable('ag')
            let s:ctrlp_fallback = 'ag %s --nocolor -l- -g ""'
        elseif executable('ack-grep')
            let s:ctrlp_fallback = 'ack-grep %s --nocolor -f'
        elseif executable('ack')
            let s:ctrlp_fallback = 'ack %s --nocolor -f'
        else
            let s:ctrlp_fallback = 'find %s -type f'
        endif
        if exists("g:ctrlp_user_command")
            unlet g:ctrlp_user_command
        endif
        let g:ctrlp_user_command = {
            \ 'types': {
                \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
                \ 2: ['.hg', 'hg --cwd %s locate -I .'],
            \ },
            \ 'fallback': s:ctrlp_fallback
        \ }
        let g:ctrlp_map = '<leader>p'
        let g:ctrlp_cmd = 'CtrlPMixed'

        nmap <leader>b :CtrlPBuffer<CR>

    endif

    " Vim Indent Guides
    if isdirectory(expand("~/.vim/bundle/vim-indent-guides"))
        let g:indent_guides_auto_colors = 0
        let g:indent_guides_start_level = 2
        let g:indent_guides_guide_size = 1
        let g:indent_guides_enable_on_vim_startup = 1
        highlight IndentGuidesOdd  ctermbg=0
        highlight IndentGuidesEven ctermbg=234
    endif

    " GitGutter
    if isdirectory(expand("~/.vim/bundle/vim-gitgutter"))
        let g:gitgutter_max_signs=1000
    endif

    " Closetag
    if isdirectory(expand("~/.vim/bundle/vim-closetag"))
        let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.php"
    endif

    " Ultisnips
    if isdirectory(expand("~/.vim/bundle/ultisnips"))
        let g:UltiSnipsExpandTrigger       ="<leader>s"
        let g:UltiSnipsJumpForwardTrigger  ="<leader>s"
        let g:UltiSnipsJumpBackwardTrigger ="<leader>S"
        let g:UltiSnipsListSnippets        ="<leader>l"
    endif

    " Undotree
    if isdirectory(expand("~/.vim/bundle/undotree"))
        nnoremap <leader>u :UndotreeToggle<cr>
    endif

    " neocomplete
    if isdirectory(expand("~/.vim/bundle/neocomplete"))

        let g:neocomplete#enable_at_startup = 1
        let g:neocomplete#enable_smart_case = 1
        let g:neocomplete#enable_auto_delimeter = 1
        let g:neocomplete#max_list = 15
        let g:neocomplete#force_overwrite_completefunc = 1

        let g:neocomplete#sources#dictionary#dictionaries = {
            \ 'default' : '',
            \ 'vimshell' : $HOME . '/.vimshell_hist',
            \ 'scheme' : $HOME . '/.gosh_completions'
            \ }

        if !exists('g:neocomplete#keyword_patterns')
            let g:neocomplete#keyword_patterns = {}
        endif
        let g:neocomplete#keyword_patterns['default'] = '\h\w*'

        "imap <C-k> <Plug>(neosnippet_expand_or_jump)
        "smap <C-k> <Plug>(neosnippet_expand_or_jump)

        "imap <silent><expr><C-k> neosnippet#expandable() ?
            "\ "\<Plug>(neosnippet_expand_or_jump)" : (pumvisible() ?
            "\ "\<C-e>" : "\<Plug>(neosnippet_expand_or_jump)")
        smap <TAB> <Right><Plug>(neosnippet_jump_or_expand)
        inoremap <expr><C-g> neocomplete#undo_completion()
        "inoremap <expr><C-l> neocomplete#complete_common_string()
        inoremap <expr><s-CR> pumvisible() ? neocomplete#smart_close_popup() . "\<CR>" : "\<CR>"

        function! CleverCr()
            if pumvisible()
                if neosnippet#expandable()
                    let exp = "\<Plug>(neosnippet_expand)"
                    return exp . neocomplete#smart_close_popup()
                else
                    return neocomplete#smart_close_popup()
                endif
            else
                return "\<CR>"
            endif
        endfunction

        imap <expr> <CR> CleverCr()
        inoremap <expr><BS> neocomplete#smart_close_popup() . "\<C-h>"
        inoremap <expr><C-y> neocomplete#smart_close_popup()

        inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
        inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

        function! CleverTab()
            if pumvisible()
                return "\<C-n>"
            endif
            let substr = strpart(getline('.'), 0, col('.') - 1)
            let substr = matchstr(substr, '[^ \t]*$')
            if strlen(substr) == 0
                " nothing to match on empty string
                return "\<Tab>"
            else
                " existing text matching
                if neosnippet#expandable_or_jumpable()
                    return "\<Plug>(neosnippet_expand_or_jump)"
                else
                    return neocomplete#start_manual_complete()
                endif
            endif
        endfunction

        imap <expr> <Tab> CleverTab()

        if !exists('g:neocomplete#sources#omni#input_patterns')
            let g:neocomplete#sources#omni#input_patterns = {}
        endif
        let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
        let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
        let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
        let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
        let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'

    endif

    " neosnippet
    if isdirectory(expand("~/.vim/bundle/neosnippet"))

        " Enable neosnippet snipmate compatibility mode
        let g:neosnippet#enable_snipmate_compatibility = 1

        " Use honza's snippets.
        let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

        " For snippet_complete marker.
        if has('conceal')
            set conceallevel=2 concealcursor=i
        endif

    endif

    " NERDTree
    if isdirectory(expand("~/.vim/bundle/nerdtree"))

        nmap <leader>e :NERDTreeToggle<CR>

        let NERDTreeShowBookmarks=1
        let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
        let NERDTreeChDirMode=0
        let NERDTreeMouseMode=2
        let NERDTreeShowHidden=1
        let NERDTreeWinSize=40
        let NERDTreeMinimalUI=1
        let NERDTreeKeepTreeInNewTab=1
        let g:nerdtree_tabs_open_on_gui_startup=1

        " Open NERDTree when Vim starts
        "autocmd vimenter * NERDTree

        " Only open NERDTree when Vim starts empty
        autocmd StdinReadPre * let s:std_in=1
        autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

        " Close vim if the only window left open is a NERDTree
        autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

    endif

    " vim-tmux-navigator
    if isdirectory(expand("~/.vim/bundle/vim-tmux-navigator"))

        " seemless moving around between tmux panes and vim splits
        nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
        nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
        nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
        nnoremap <silent> <C-l> :TmuxNavigateRight<cr>

    endif

    " Vim-php-cs-fixer
    if isdirectory(expand("~/.vim/bundle/vim-php-cs-fixer"))
        let g:php_cs_fixer_level = "psr2"
    endif

    " tagbar
    if isdirectory(expand("~/.vim/bundle/tagbar"))
        autocmd FileType * nested :call tagbar#autoopen(0)
        nmap <leader>t :TagbarToggle<CR>
    endif

    " CamelCaseMotion
    if isdirectory(expand("~/.vim/bundle/CamelCaseMotion"))

        " Replace the default 'w', 'b' and 'e' mappings instead of defining additional mappings ',w', ',b' and ',e'
        "map <silent> w <Plug>CamelCaseMotion_w
        "map <silent> b <Plug>CamelCaseMotion_b
        "map <silent> e <Plug>CamelCaseMotion_e
        "sunmap w
        "sunmap b
        "sunmap e

        " Replace default 'iw' text-object and define 'ib' and 'ie' motions
        "omap <silent> iw <Plug>CamelCaseMotion_iw
        "xmap <silent> iw <Plug>CamelCaseMotion_iw
        "omap <silent> ib <Plug>CamelCaseMotion_ib
        "xmap <silent> ib <Plug>CamelCaseMotion_ib
        "omap <silent> ie <Plug>CamelCaseMotion_ie
        "xmap <silent> ie <Plug>CamelCaseMotion_ie

    endif

    " vim-php-manual
    if isdirectory(expand("~/.vim/bundle/vim-php-manual"))
        let g:php_manual_online_search_shortcut = "<s-P>"
    endif

    " ZoomWin
    if isdirectory(expand("~/.vim/bundle/ZoomWin"))
        nmap <leader>z :ZoomWin<CR>
    endif

endif " bundles_loaded

"===============================================================================
" Colors
"===============================================================================

syntax on
set t_Co=256
set background=dark

autocmd ColorScheme * highlight ColorColumn  ctermbg=236
autocmd ColorScheme * highlight CursorLine   ctermbg=236 ctermfg=none
autocmd ColorScheme * highlight CursorLineNr ctermbg=234 ctermfg=grey
autocmd ColorScheme * highlight FoldColumn   ctermbg=234
autocmd ColorScheme * highlight LineNr       ctermbg=234 ctermfg=darkgrey
autocmd ColorScheme * highlight Normal       ctermbg=none " Show the terminal background, alternatively: ctermbg=235
autocmd ColorScheme * highlight NonText      ctermbg=none
autocmd ColorScheme * highlight Search       ctermbg=yellow ctermfg=black
autocmd ColorScheme * highlight SignColumn   ctermbg=234
autocmd ColorScheme * highlight SpellBad     ctermbg=none ctermfg=none cterm=underline
autocmd ColorScheme * highlight SpellCap     ctermbg=none ctermfg=none cterm=underline
autocmd ColorScheme * highlight SpellLocal   ctermbg=none ctermfg=none cterm=underline
autocmd ColorScheme * highlight SpellRare    ctermbg=none ctermfg=none cterm=underline
autocmd ColorScheme * highlight StatusLine   ctermbg=234
autocmd ColorScheme * highlight VertSplit    ctermbg=234 ctermfg=234

" Highlight unwanted whitespace
autocmd ColorScheme * highlight TrailingWhitespace     ctermbg=red guibg=red
autocmd ColorScheme * highlight TabWhitespace          ctermbg=red guibg=red
autocmd ColorScheme * highlight SpaceIndent            ctermbg=red guibg=red
autocmd ColorScheme * highlight DoubleSpaceAfterPeriod ctermbg=red guibg=red

" Choose our colorscheme
"let g:solarized_termcolors=256
"let g:solarized_termcolors=16
"silent! colorscheme solarized
"silent! colorscheme monokai
"silent! colorscheme molokai
"silent! colorscheme zenburn
silent! colorscheme Tomorrow-Night

"===============================================================================
" Misc
"===============================================================================

" Return to last edit position when opening files
augroup resCur
    autocmd!
    autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

" Modify buffer settings
set viminfo='50,<1000,s100,h,%

" Delete trailing white space on save
func! DeleteTrailingWS()
    " Excluding Mardown
    if &ft =~ 'markdown'
        return
    endif
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWritePre * call DeleteTrailingWS()


au BufRead,BufNewFile *.json set ft=json syntax=javascript

" set up syntax highlighting for email
au BufRead,BufNewFile *tmp/mutt* :set ft=mail


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Always switch to the current file directory
autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif

let php_minlines=500

"===============================================================================
" Local overrides
"===============================================================================

let $LOCALFILE=expand("~/.vimrc_local")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif

" vim: set nospell:
" EOF
