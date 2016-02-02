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
set visualbell                 " disable annoying bell
set t_vb=                      " Empty the variable that stores the visualbell character
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
    set colorcolumn=+1,81,121     " show a column at textwidth+1 chars as the boundary of textwidth
endif
set cursorline                 " highlight the line that the cursor is on
set nocursorcolumn             " don't highlight the column the cursor is on
set viewoptions=folds,options,cursor,unix,slash
set scrolloff=7                " start vertically scrolling when 7 lines from the top or bottom
set sidescrolloff=3            " start horizontally scrolling when 3 lines from the edges
set sidescroll=1               " how many columns to scroll at a time horizontally
set splitbelow                 " Open new split below rather than above
set splitright                 " Open new vertical split to the right, rather than left
set switchbuf=useopen,usetab   " Look for buffers open in other windows and tabs
set notimeout
set ttimeout
set viminfo='50,<1000,s100,h   " Modify what is remembered in the viminfo file

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
set tabstop=4     " number of spaces that a <Tab> in the file counts for
set expandtab     " expand tabs to spaces
set shiftwidth=4  " number of spaces to use for each step of (auto)indent
set softtabstop=0 " number of spaces that a <Tab> counts for while performing editing operations

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
autocmd FileType css        setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html       setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType markdown   setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python     setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml        setlocal omnifunc=xmlcomplete#CompleteTags

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

" Use the default leader
let mapleader = "\\"
let g:mapleader = "\\"

" Map space to be a leader key as well (so that showcmd works for space)
map <Space> <Leader>

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
"nmap <leader>o :set paste!<CR>

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
nnoremap <Leader><Leader> <c-^>

" Use xclip for copy/paste
vmap "+y :!xclip -f -sel clip
map  "+p :r!xclip -o -sel clip

" Stop the annoying command history popup from typo
map q: :q

" https://stackoverflow.com/questions/1444322/how-can-i-close-a-buffer-without-closing-the-window
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

" Use sudo to write the file
cmap w!! w !sudo tee % >/dev/null
cmap wq!! wq !sudo tee % >/dev/null

" Map <Leader>ff to display all lines with keyword under cursor and ask which one to jump to
"nmap <Leader>f [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

nmap <leader>o :!xdg-open %<cr><cr>

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

if b:bundles_loaded == 1 && filereadable(expand("~/.vimrc.bundleconfig"))
    source ~/.vimrc.bundleconfig
endif

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


" Delete trailing whitespace on save
func! DeleteTrailingWS()
    " Excluding Mardown
    if &ft =~ 'markdown'
        return
    endif
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
" autocmd BufWritePre * call DeleteTrailingWS()

au BufRead,BufNewFile *.json set ft=json syntax=javascript

" set up syntax highlighting for email
au BufRead,BufNewFile *tmp/mutt* :set ft=mail

" Always switch to the current file directory
"autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif

" Leave paste mode when leaving insert mode
autocmd InsertLeave * set nopaste

"let php_minlines=500

" Automatically re-source the .vimrc on save
augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc source %
augroup end

set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

"===============================================================================
" Local overrides
"===============================================================================

let $LOCALFILE=expand("~/.vimrc_local")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif

" vim: set nospell:
" EOF
