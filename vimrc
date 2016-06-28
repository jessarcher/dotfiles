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
"===============================================================================

" Make sure Vim features are enabled first
set nocompatible

" Load plugins
if filereadable(expand("~/.vimrc.plugins"))
    source ~/.vimrc.plugins
endif

" }}}

" General Settings {{{
"===============================================================================

set number                     " show line number(s)
if exists('+relativenumber')
    set relativenumber         " show line numbers relative to the current line
endif
set history=1000               " store lots of :cmdline history
set autoread                   " reload files changed outside of vim
set visualbell                 " replace annoying error bell with annoying screen flash
set t_vb=                      " make the visual bell do nothing (so it's not annoying)
set title                      " set term title
let &titleold=''               " get rid of the pesky 'Thanks for flying Vim' title on exit
set showtabline=1              " tab bar display setting: 0: never, 1: only when >1 tabs, 2: always
set showcmd                    " show commands as they are being typed (e.g. 2dd), also the number of lines or the dimensions in Visual selection modes
if exists('+colorcolumn')
    set colorcolumn=+1,81,121  " show a column at textwidth+1 chars as the boundary of textwidth
endif
set nowrap                     " don't display lines wrapped by default
set linebreak                  " when wrapping, break at end of word rather than mid-word
set ruler                      " show line and column numbers (only useful when statusbar not enabled)"
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
set display=lastline
set encoding=utf-8
set laststatus=2
set viminfo+=%                 " Restore previous buffers when starting
set showmatch

" }}}

" Moving Around {{{
"===============================================================================

set mouse=a                    " enable use of mouse in all modes with a supported terminal"
set cursorline                 " highlight the line that the cursor is on
set scrolloff=3                " start vertically scrolling when 3 lines from the top or bottom
set sidescrolloff=3            " start horizontally scrolling when 3 lines from the edges
set sidescroll=1               " how many columns to scroll at a time horizontally
set nostartofline              " don't reset cursor to start of line when moving around

" }}}

" Text Editing and Formatting {{{
"===============================================================================

set backspace=indent,eol,start " allow full backspace in insert mode
set textwidth=80               " width of text before breaking
set nojoinspaces               " only insert single space after '.', '?', and '!' when joining
set nrformats-=octal           " Treat strings starting with '0' as numbers for the purposes of incrementing
set formatoptions=             " reset formatoptions
set formatoptions+=c           " format comments
set formatoptions+=r           " continue comments onto next line
set formatoptions+=q           " format comments with gq
set formatoptions+=n           " recognize numbered lists
set formatoptions+=2           " use indent from 2nd line of a paragraph
set formatoptions+=l           " don't break lines that are already long
set formatoptions+=1           " break before 1-letter words
if v:version > 703 || v:version == 703 && has("patch541")
    set formatoptions+=j       " delete comment character when joining commented lines
endif
autocmd FileType * setlocal formatoptions-=o " don't comment newline when using o or O from a commented line (needs autocmd otherwise it gets overwritten)

" }}}

" Tabs & Indentation {{{
"===============================================================================

set expandtab                  " Use spaces instead of tabs
set tabstop=4                  " How many characters wide the tab character should be
set shiftwidth=4               " How many spaces to use instead of a tab
set smarttab                   " Intelligently backspace the right number of space characters

set autoindent                 " Copy indent level from previous line when starting a new line
set smartindent                " Seems to automatically update the indentation when a closing paren is typed
set copyindent                 " Copy whatever characters were used to indent the previous line
set preserveindent             " Preserve as much of the existing indentation characters when changing indentation level

set list                       " display tabs, tailing spaces, and other chars visually
set listchars=tab:▸\ ,space:·,trail:·,extends:→,precedes:←,nbsp:␣,eol:↲
set showbreak=↪\

augroup something
    autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
    autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    autocmd InsertLeave * match ExtraWhitespace /\s\+$/
augroup end

" }}}

" Searching {{{
"===============================================================================

set hlsearch                   " highlight search matches
set incsearch                  " start searching while typing
set magic                      " enable regex for searches
set ignorecase                 " case insensitive searches
set smartcase                  " unless specifically searching for something with uppercase characters

" }}}

" Copy and Paste {{{
"===============================================================================

set clipboard^=unnamed,unnamedplus " use the system clipboard

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
"===============================================================================

" }}}

" Keymapping {{{
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

nmap <leader>w :w<cr>

nmap <leader>q :Bdelete<CR>

nmap <leader>l :setlocal number!<CR>:setlocal list!<CR>:silent! GitGutterToggle<CR>:silent! setlocal relativenumber!<CR>

nmap <leader>f :CtrlP<CR>
nmap <leader>s :CtrlPBufTag<CR>
nmap <leader>b :CtrlPBuffer<CR>
nmap <leader>v :CtrlP vendor<CR>

nmap <leader>o :!xdg-open %<cr><cr>

nmap <leader>n :NERDTreeToggle<CR>

nmap <leader>d :call pdv#DocumentWithSnip()<cr>

nmap <leader>t :TagbarToggle<CR>

" Switch between the last two files
nmap <leader><leader> <c-^>

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

vnoremap < <gv                 " Reselect visual selection after indenting
vnoremap > >gv                 " Reselect visual selection after de-indenting

" Clear search highlighting
nnoremap <silent> <leader>k :nohl<CR>

" Visually select last pasted text using same visual mode
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" When text is wrapped, move by terminal rows, not lines, unless a count is provided
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

cmap w!! %!sudo tee > /dev/null %

" Stop the annoying command history popup from typo
map q: :q

nnoremap <leader>g :Ag<space>

nmap c* *Ncgn

" }}}

" Spell Checking {{{
"===============================================================================

set spell                      " enable spell checking
set spelllang=en_au            " self-explanatory

" }}}

" Colors {{{
"===============================================================================

syntax on
set background=dark

if !empty(glob('~/.vim/bundle/base16-vim/'))
    colorscheme base16-tomorrow
endif

highlight SpecialKey  ctermfg=237
highlight NonText     ctermfg=237
highlight MatchParent ctermbg=240

" }}}

" Buffers {{{
"===============================================================================

set hidden                     " allow unwritten buffers in the background

" Move between buffers like tabs
nmap <C-n> :bnext<CR>
nmap <C-p> :bprev<CR>

" }}}

" Splits {{{
"===============================================================================

set splitbelow                 " Open new split below rather than above
set splitright                 " Open new vertical split to the right, rather than left

" }}}

" Folds {{{
"===============================================================================

" }}}

" Filetype Overrides {{{
"===============================================================================

augroup filetypeoverrides
    autocmd!

    " Give JSON files JavaScript highlighting
    au BufRead,BufNewFile *.json set ft=json syntax=javascript

    " Format Mutt temp files as email
    au BufRead,BufNewFile *tmp/mutt* set ft=mail
augroup end

" }}}

" Programming-specific {{{
"===============================================================================

" Look for tags files in parent directories
if has('path_extra')
    setglobal tags-=./tags tags-=./tags; tags^=./tags;,./vendor-tags;
endif

" }}}

" General Auto-commands {{{
"===============================================================================

augroup generalautocommands
    autocmd!

    " Return to last edit position when opening files
    autocmd BufReadPost * call setpos(".", getpos("'\""))

    " Automatically re-source the .vimrc on save
    autocmd BufWritePost .vimrc source %
    autocmd BufWritePost .vimrc.plugins source %

    autocmd FileType php setlocal commentstring=//%s
augroup end

" }}}

" Speed Improvements {{{
"===============================================================================

set lazyredraw                 " seems to fix scrolling issues caused by relativenumber and cursorline"
set ttyfast
syntax sync minlines=100
syntax sync maxlines=240
set synmaxcol=800

" }}}

" Backups {{{
"===============================================================================

if !isdirectory($HOME . '/.vim/backups')
    call mkdir($HOME . '/.vim/backups', 'p')
endif
set backupdir=~/.vim/backups
set backup

" }}}

" Swap Files {{{
"===============================================================================

if !isdirectory($HOME . '/.vim/swaps')
    call mkdir($HOME . '/.vim/swaps', 'p')
endif
set directory=~/.vim/swaps

" }}}

" Undo {{{
"===============================================================================

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
"===============================================================================

let $LOCALFILE=expand("~/.vimrc_local")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif

" }}}

" vim: set nospell foldmethod=marker foldlevel=0:
