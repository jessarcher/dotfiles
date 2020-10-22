"                                    ________
"                                  |\\#######\
"                                  |#\\#######\
"                                  |##\\#######\
"                                  |###\\#######\
"                                  #####\\#######\
"                         _______,#######|\#######\
"                         \W############W  \#######\
"                          \W##########W    \#######\
"                           '#########'      \#######\
"                              ¯¯¯¯¯          ¯¯¯¯¯¯¯¯
"
"       Personal vim configuration of Jess Archer <jess@jessarcher.com>

"--------------------------------------------------------------------------
" General settings
"--------------------------------------------------------------------------

set expandtab
set shiftwidth=4
set tabstop=4
set hidden
set signcolumn=yes:2
set relativenumber
set number
set termguicolors
set undofile
set spell
set title
set inccommand=nosplit
set ignorecase
set smartcase
set wildmode=longest:full,full
set nowrap
set list
set listchars=tab:▸\ ,trail:·
set mouse=a
set scrolloff=3
set sidescrolloff=3
set nojoinspaces
set splitright
set clipboard=unnamedplus
set confirm

"--------------------------------------------------------------------------
" General key maps
"--------------------------------------------------------------------------

let mapleader = "\<space>"

nmap <leader>ve :edit ~/.config/nvim/init.vim<cr>
nmap <leader>vc :edit ~/.config/nvim/coc-settings.json<cr>
nmap <leader>vr :source ~/.config/nvim/init.vim<cr>

nmap <leader>k :nohlsearch<CR>

map gf :edit <cfile><cr>

nmap <silent> <C-h> <C-w>h
nmap <silent> <C-j> <C-w>j
nmap <silent> <C-k> <C-w>k
nmap <silent> <C-l> <C-w>l

" Reselect visual selection after indenting
vnoremap < <gv
vnoremap > >gv

" Maintain the cursor position when yanking a visual selection
" http://ddrscott.github.io/blog/2016/yank-without-jank/
vnoremap y myy`y
vnoremap Y myY`y

" When text is wrapped, move by terminal rows, not lines, unless a count is provided
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Paste replace visual selection without copying it
vnoremap <leader>p "_dP

" Open the current file in the default program
nmap <leader>x :!xdg-open %<cr><cr>

" Quicky escape to normal mode
imap jj <esc>

" Easy insertion of a trailing ; or , from insert mode
imap ;; <Esc>A;<Esc>
imap ,, <Esc>A,<Esc>

cmap w!! %!sudo tee > /dev/null %

"--------------------------------------------------------------------------
" Miscellaneous
"--------------------------------------------------------------------------

" Create any required directories when saving
function s:CreateMissingDirectories(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction

augroup CreateMissingDirectories
    autocmd!
    autocmd BufWritePre * :call s:CreateMissingDirectories(expand('<afile>'), +expand('<abuf>'))
augroup END

"--------------------------------------------------------------------------
" Plugins
"--------------------------------------------------------------------------

" Automatically install vim-plug
if empty(glob('~/.local/share/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugins')

source ~/.config/nvim/plugins/fzf.vim
source ~/.config/nvim/plugins/sayonara.vim
source ~/.config/nvim/plugins/airline.vim
source ~/.config/nvim/plugins/coc.vim
source ~/.config/nvim/plugins/dracula.vim
source ~/.config/nvim/plugins/commentary.vim
source ~/.config/nvim/plugins/surround.vim
source ~/.config/nvim/plugins/repeat.vim
source ~/.config/nvim/plugins/polyglot.vim
source ~/.config/nvim/plugins/context-commentstring.vim
source ~/.config/nvim/plugins/sleuth.vim
source ~/.config/nvim/plugins/vim-test.vim
source ~/.config/nvim/plugins/lastplace.vim
source ~/.config/nvim/plugins/fugitive.vim
source ~/.config/nvim/plugins/floaterm.vim
source ~/.config/nvim/plugins/splitjoin.vim
source ~/.config/nvim/plugins/projectionist.vim
source ~/.config/nvim/plugins/editorconfig.vim
source ~/.config/nvim/plugins/pasta.vim
source ~/.config/nvim/plugins/quickscope.vim
source ~/.config/nvim/plugins/visual-star-search.vim
source ~/.config/nvim/plugins/rooter.vim

call plug#end()

"--------------------------------------------------------------------------
" Post-plugin settings
"--------------------------------------------------------------------------

colorscheme dracula

"--------------------------------------------------------------------------
" FileType Overrides
"--------------------------------------------------------------------------

augroup FileTypeOverrides
    autocmd!
    " Use '//' instead of '/* */' comments
    autocmd FileType php setlocal commentstring=//%s
augroup END
