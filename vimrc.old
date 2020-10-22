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
        if empty(glob('~/.vim/autoload/plug.vim'))
            silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
            autocmd VimEnter * PlugInstall | source $MYVIMRC
        endif

        call plug#begin('~/.vim/bundle')
    " }}}

    " IndexedSearch - shows 'Nth match out of M' at every search {{{
        Plug 'vim-scripts/IndexedSearch'
    " }}}

    " LargeFile - Edit large files quickly {{{
        let g:LargeFile = 1
        Plug 'vim-scripts/LargeFile'
    " }}}

    " vim-visual-star-search - Start a * or # search from a visual block {{{
        Plug 'nelstrom/vim-visual-star-search'
    " }}}

    " ultisnips - The ultimate snippet solution for Vim {{{
        " Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

        " let g:UltiSnipsSnippetDirectories=['UltiSnips', $HOME.'/.vim/UltiSnips']

        " let g:ultisnips_php_scalar_types = 1

        " autocmd FileType php UltiSnipsAddFiletypes laravel.php
        " autocmd FileType vue UltiSnipsAddFiletypes vue.javascript

        " let g:UltiSnipsExpandTrigger       ="<tab>"
        " let g:UltiSnipsJumpForwardTrigger  ="<tab>"
        " let g:UltiSnipsJumpBackwardTrigger ="<s-tab>"
    " }}}

    " tagbar {{{
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

    " vim-fugitive - A Git wrapper so awesome, it should be illegal {{{
        Plug 'tpope/vim-fugitive'
        Plug 'tpope/vim-rhubarb' " Github support
        Plug 'shumphrey/fugitive-gitlab.vim' " Gitlab support

        nmap <leader>gs :Gstatus<cr>
        nmap <leader>gb :Gblame<cr>
        nmap <leader>gcv :Gcommit -v<cr>
        nmap <leader>gca :Gcommit -v --amend<cr>
        nmap <leader>gp :Gpush<cr>
    " }}}

    " vim-dispatch - Asynchronous build and test dispatcher {{{
        Plug 'tpope/vim-dispatch'
    " }}}

    " vim-tmux-navigator - Seamless navigation between tmux panes and vim splits {{{
        Plug 'christoomey/vim-tmux-navigator'

        " seemless moving around between tmux panes and vim splits
        nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
        nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
        nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
        nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
    " }}}

    " vim-tmux-focus-events - Make terminal vim and tmux work better together. {{{
        Plug 'tmux-plugins/vim-tmux-focus-events'
    " }}}

    " vim-commentary {{{
        Plug 'tpope/vim-commentary'
    " }}}

    " vim-unimpaired - Pairs of handy bracket mappings {{{
        Plug 'tpope/vim-unimpaired'
        augroup unimpaired
            autocmd!
            autocmd VimEnter * unmap <silent><expr> co
        augroup END
    " }}}

    " vim-abolish - easily search for, substitute, and abbreviate multiple variants of a word {{{
        Plug 'tpope/vim-abolish'
    " }}}

    " vim-vue - Syntax highlight for Vue.js components {{{
        Plug 'posva/vim-vue'
        augroup vue
            autocmd!
            autocmd BufEnter *.vue syntax sync fromstart " Fix issue with syntax highlight disappearing randomly
        augroup END
    " }}}

    " vim-context-commentstring - sets the value of ‘commentstring’ to a different value depending on the region of the file you are in. {{{
        Plug 'suy/vim-context-commentstring'
    " }}}

    " airline {{{
        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'
        " let g:airline#extensions#tabline#enabled = 1
        let g:airline_powerline_fonts = 1
        let g:airline_skip_empty_sections = 1
        let g:airline_theme = 'dracula'
        " Always show tabs
        "set showtabline=2

        " We don't need to see things like -- INSERT -- anymore
        set noshowmode
    " }}}

    " lightline.vim {{{
        " Plug 'itchyny/lightline.vim'

        " let g:lightline = {}

        " let g:lightline.fname = ''

        " let g:lightline.active = {
        "     \ 'left': [
        "         \ [ 'mode', 'paste', 'spell' ],
        "         \ [ 'cocstatus', 'currentfunction', 'fugitive', 'filename' ],
        "         \ [ 'ctrlpmark' ]
        "     \ ],
        "     \ 'right': [
        "         \ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok', 'lineinfo' ],
        "         \ [ 'percent' ],
        "         \ [ 'fileformat', 'fileencoding', 'filetype', 'indent' ],
        "         \ [ 'blame' ]
        "     \ ]
        " \ }

        " let g:lightline.colorscheme = 'dracula'

        " let g:lightline.component_expand = {
        "     \ 'linter_checking': 'lightline#ale#checking',
        "     \ 'linter_warnings': 'lightline#ale#warnings',
        "     \ 'linter_errors': 'lightline#ale#errors',
        "     \ 'linter_ok': 'lightline#ale#ok',
        " \ }

        " let g:lightline.component_function = {
        "     \ 'ctrlpmark': 'CtrlPMark',
        "     \ 'fileencoding': 'LightLineFileencoding',
        "     \ 'fileformat': 'LightLineFileformat',
        "     \ 'filename': 'LightLineFilename',
        "     \ 'filetype': 'LightLineFiletype',
        "     \ 'fugitive': 'LightLineFugitive',
        "     \ 'gutentags': 'LightLineGutentags',
        "     \ 'mode': 'LightLineMode',
        "     \ 'indent': 'LightLineIndent',
        "     \ 'cocstatus': 'coc#status',
        "     \ 'currentfunction': 'CocCurrentFunction',
        "     \ 'blame': 'LightlineGitBlame'
        " \ }

        " let g:lightline.component_type = {
        "     \ 'linter_checking': 'left',
        "     \ 'linter_warnings': 'warning',
        "     \ 'linter_errors': 'error',
        "     \ 'linter_ok': 'left',
        " \ }

        " let g:lightline.separator = { 'left': '', 'right': '' }
        " let g:lightline.subseparator = { 'left': '', 'right': '' }

        " function! CtrlPMark()
        "     if expand('%:t') =~ 'ControlP' && has_key(g:lightline, 'ctrlp_item')
        "         call lightline#link('iR'[g:lightline.ctrlp_regex])
        "         return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item, g:lightline.ctrlp_next], 0)
        "     else
        "         return ''
        "     endif
        " endfunction

        " let g:ctrlp_status_func = {
        "     \ 'main': 'CtrlPStatusFunc_1',
        "     \ 'prog': 'CtrlPStatusFunc_2',
        " \ }

        " function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
        "     let g:lightline.ctrlp_regex = a:regex
        "     let g:lightline.ctrlp_prev = a:prev
        "     let g:lightline.ctrlp_item = a:item
        "     let g:lightline.ctrlp_next = a:next
        "     return lightline#statusline(0)
        " endfunction

        " function! CtrlPStatusFunc_2(str)
        "     return lightline#statusline(0)
        " endfunction

        " function! LightLineMode()
        "     let fname = expand('%:t')
        "     return fname =~ '__Tagbar__' ? 'Tagbar' :
        "         \ fname == 'ControlP' ? 'CtrlP' :
        "         \ fname == '__Gundo__' ? 'Gundo' :
        "         \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        "         \ fname =~ 'NERD_tree' ? 'NERDTree' :
        "         \ &ft == 'unite' ? 'Unite' :
        "         \ &ft == 'vimfiler' ? 'VimFiler' :
        "         \ &ft == 'vimshell' ? 'VimShell' :
        "         \ winwidth(0) > 60 ? lightline#mode() : ''
        " endfunction

        " function! LightLineModified()
        "     return &ft =~ 'help' ? '' : &modified ? '✎' : &modifiable ? '' : '-'
        " endfunction

        " function! LightLineReadonly()
        "     return &ft !~? 'help' && &readonly ? '' : ''
        " endfunction

        " function! LightLineFilename()
        "     let fname = expand('%:t')
        "     return fname == 'ControlP' && has_key(g:lightline, 'ctrlp_item') ? g:lightline.ctrlp_item :
        "         \ fname =~ '__Tagbar__' ? '' :
        "         \ fname =~ '__Gundo\|NERD_tree' ? '' :
        "         \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        "         \ &ft == 'unite' ? unite#get_status_string() :
        "         \ &ft == 'vimshell' ? vimshell#get_status_string() :
        "         \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        "         \ ('' != fname ? fname : '[No Name]') .
        "         \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
        " endfunction

        " function! LightLineFileformat()
        "     return winwidth(0) > 70 ? &fileformat : ''
        " endfunction

        " function! LightLineFiletype()
        "     return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
        " endfunction

        " function! LightLineFugitive()
        "     try
        "         if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
        "             let mark = ' '  " edit here for cool mark
        "             let branch = fugitive#head()
        "             return branch !=# '' ? mark.branch : ''
        "         endif
        "     catch
        "     endtry
        "     return ''
        " endfunction

        " function! LightLineFileencoding()
        "   return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
        " endfunction

        " function! LightLineIndent()
        "     return winwidth(0) > 70 ? (&expandtab == 1 ? 'spaces[' . &shiftwidth . ']' : 'tabs[' . &tabstop . ']') : ''
        " endfunction

        " function! LightLineGutentags()
        "     return gutentags#statusline('Generating tags...')
        " endfunction

        " let g:tagbar_status_func = 'TagbarStatusFunc'

        " function! TagbarStatusFunc(current, sort, fname, ...) abort
        "     let g:lightline.fname = a:fname
        "     return lightline#statusline(0)
        " endfunction

        " function! CocCurrentFunction()
        "     return get(b:, 'coc_current_function', '')
        " endfunction

        " function! LightlineGitBlame() abort
        "     let blame = get(b:, 'coc_git_blame', '')
        "     " return blame
        "     return winwidth(0) > 120 ? blame : ''
        " endfunction

        " " Use auocmd to force lightline update.
        " autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
    " }}}

    " pdv - PHP Documentor for Vim - Generates PHP docblocks {{{
        Plug 'tobyS/pdv', { 'for': 'php' } | Plug 'tobyS/vmustache'

        let g:pdv_template_dir = $HOME . "/.vim/bundle/pdv/templates_snip"

        nmap <leader>pd :call pdv#DocumentWithSnip()<cr>
    " }}}

    " php.vim - Up-to-date PHP syntax file {{{
        Plug 'StanAngeloff/php.vim'
    " }}}

    " PHP-Indenting-for-VIm - The official VIm indent script for PHP {{{
        Plug '2072/PHP-Indenting-for-VIm'
    " }}}

    " phpfolding.vim - Automatic folding of PHP functions, classes,.. (aldo folds related PhpDoc) {{{
        Plug 'jessarcher/phpfolding.vim'

"         augroup phpfolding
"             autocmd!
"             autocmd InsertLeave *.php EnableFastPHPFolds
"         augroup END
    " }}}

    " html5.vim - HTML5 omnicomplete and syntax {{{
        Plug 'othree/html5.vim'
    " }}}

    " emmet-vim {{{
        Plug 'mattn/emmet-vim'
    " }}}

    " scss-syntax.vim {{{
        Plug 'cakebaker/scss-syntax.vim'
    " }}}

    " vim-css3-syntax - Add CSS3 syntax support to vim's built-in `syntax/css.vim` {{{
        Plug 'hail2u/vim-css3-syntax'
    " }}}

    " vim-blade - Syntax highlighting for Blade templates {{{
        Plug 'jwalton512/vim-blade'
    " }}}

    " vim-javascript - Vastly improved Javascript indentation and syntax support {{{
        Plug 'pangloss/vim-javascript'
    " }}}

    " vim-mustache-handlebars - Mustache and handlebars mode for vim {{{
        Plug 'mustache/vim-mustache-handlebars'
    " }}}

    " splitjoin.vim - Switch between single-line and multiline forms of code {{{
        Plug 'AndrewRadev/splitjoin.vim'
    " }}}

    " vim-repeat - Enable repeating supported plugin maps with . {{{
        Plug 'tpope/vim-repeat'
    " }}}

    " vim-surround - Quoting/parenthesizing made simple {{{
        Plug 'tpope/vim-surround'
    " }}}

    " targets.vim - Vim plugin that provides additional text objects {{{
        Plug 'wellle/targets.vim'
    " }}}

    " vim-indent-object {{{
        Plug 'michaeljsmith/vim-indent-object'
    " }}}

    " vim-lion - Alignment by characters {{{
        Plug 'tommcdo/vim-lion'

        let g:lion_squeeze_spaces = 1 " Remove as many spaces as possible when aligning
    " }}}

    " indentLine - A vim plugin to display the indention levels with thin vertical lines {{{
        Plug 'Yggdroot/indentLine'

        " let g:indentLine_enabled = 0
        " " let g:indentline_faster = 1
        " " let g:indentline_char = '┊'
        " " let g:indentline_first_char = '┊'
        let g:indentLine_char = '│'
        let g:indentLine_first_char = '│'
        let g:indentLine_color_term = 237
        let g:indentLine_color_gui = '#333540'
        let g:indentLine_showfirstindentlevel = 1
    " }}}

    " vim-sayonarao {{{
        Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }

        nmap <leader>q :Sayonara!<CR>
        nmap <leader>Q :Sayonara<CR>
    " }}}

    " vim-floaterm {{{
        Plug 'voldikss/vim-floaterm'
        let g:floaterm_keymap_toggle = '<F1>'
        let g:floaterm_width = 0.8
        let g:floaterm_height = 0.8
        " let g:floaterm_autoclose = 1
    " }}}

    " vim-bbye - Delete buffers and close files in Vim without closing your windows or messing up your layout. {{{
        " Plug 'moll/vim-bbye'

        " nmap <leader>q :Bdelete<CR>
    " }}}

    " vim-hardtime - Plugin to help you stop repeating the basic movement key {{{
        Plug 'takac/vim-hardtime'

        let g:hardtime_default_on = 0
        let g:hardtime_showmsg = 1
        let g:hardtime_allow_different_key = 1
        let g:hardtime_maxcount = 4
    " }}}

    " vim-smoothscroll {{{
        Plug 'terryma/vim-smooth-scroll'

        noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 4)<CR>
        noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 4)<CR>
        noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 8)<CR>
        noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 8)<CR>
    " }}}

    " localvimrc {{{
        Plug 'embear/vim-localvimrc'
        let g:localvimrc_persistent = 2
    " }}}

    " NERDTree {{{
        " Plug 'preservim/nerdtree'

        " let NERDTreeShowHidden=1
        " let NERDTreeMinimalUI=1

        " nmap <leader>n :NERDTreeToggle<CR>
        " nmap <leader>N :NERDTreeFind<CR>

        " " If more than one window and previous buffer was NERDTree, go back to it.
        " autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif

        " " avoid crashes when calling vim-plug functions while the cursor is on the NERDTree window
        " let g:plug_window = 'noautocmd vertical topleft new'

    " }}}

    " nerdtree-git-plugin {{{
        " Plug 'Xuyuanp/nerdtree-git-plugin'
    " }}}

    " vim-devicons {{{
        " Plug 'ryanoasis/vim-devicons'
        " Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

        " let g:WebDevIconsUnicodeDecorateFolderNodes = 1
        " let g:DevIconsEnableFoldersOpenClose = 1
        " let g:DevIconsEnableFolderExtensionPatternMatching = 1
    " }}}

    " apiblueprint.vim {{{
        " Plug 'kylef/apiblueprint.vim'
    " }}}

    " vim-argwrap - Wrap and unwrap function arguments, lists, and dictionaries in Vim {{{
        Plug 'FooSoft/vim-argwrap'

        " let g:argwrap_tail_comma = 1
        let g:argwrap_tail_comma_braces = '['
        " nnoremap <silent> <leader>aw :ArgWrap<CR>
    " }}}

    " vim-pasta - Pasting in Vim with indentation adjusted to destination context {{{
        Plug 'sickill/vim-pasta'

        let g:pasta_disabled_filetypes = ['fugitive']
    " }}}

    " vim-json {{{
        Plug 'elzr/vim-json'
        let g:vim_json_syntax_conceal = 0
    " }}}

    " quick-scope {{{
        Plug 'unblevable/quick-scope'
        " Trigger a highlight in the appropriate direction when pressing these keys:
        let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
        let g:qs_max_chars=150
    " }}}

    " onedark.vim {{{
        " Plug 'joshdick/onedark.vim'

        " augroup onedarkextend
        "     autocmd!
        "     " Make non text characters (like listchars) barely visible
        "     autocmd ColorScheme * call onedark#extend_highlight("NonText", { "fg": { "cterm": 237 } })

        "     " Don't give spelling errors a special colour
        "     autocmd ColorScheme * call onedark#extend_highlight("SpellBad", { "fg": { "cterm": "NONE" } })
        "     autocmd ColorScheme * call onedark#extend_highlight("SpellLocal", { "fg": { "cterm": "NONE" } })
        "     autocmd ColorScheme * call onedark#extend_highlight("SpellRare", { "fg": { "cterm": "NONE" } })
        "     autocmd ColorScheme * call onedark#extend_highlight("SpellCap", { "fg": { "cterm": "NONE" } })
        " augroup end

        " let g:onedark_hide_endofbuffer = 1
        " let g:onedark_terminal_italics = 1
    " }}}

    " dracula {{{
        Plug 'dracula/vim', { 'as': 'dracula' }

        "Include bold attributes in highlighting >
        let g:dracula_bold = 1

        " Include italic attributes in highlighting >
        let g:dracula_italic = 1

        " Include underline attributes in highlighting >
        let g:dracula_underline = 1

        " Include undercurl attributes in highlighting (only if underline enabled) >
        let g:dracula_undercurl = 1

        " Include inverse attributes in highlighting >
        let g:dracula_inverse = 1

        " Include background fill colors >
        let g:dracula_colorterm = 1

        augroup dracula_customization
            autocmd!
            autocmd ColorScheme * highlight CursorLine guibg=#2E303C
            autocmd ColorScheme * highlight Folded guibg=NONE
        augroup end
    " }}}"

    " editorconfig {{{
        Plug 'editorconfig/editorconfig-vim'

        " Ensure that this plugin works well with Tim Pope's fugitive
        let g:EditorConfig_exclude_patterns = ['fugitive://.*']
    " }}}

    " fzf {{{
        Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
        Plug 'junegunn/fzf.vim'

        let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8, 'yoffset':0.5, 'xoffset': 0.5 } }
        let g:fzf_preview_window = 'right:50%'

        let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
        " let $FZF_DEFAULT_COMMAND="rg --files --hidden"

        " Customise the Files command to use rg for ignoring .gitignore files
        command! -bang -nargs=? -complete=dir Files
            \ call fzf#run(fzf#wrap('files', fzf#vim#with_preview({ 'dir': <q-args>, 'sink': 'e', 'source': 'rg --files --hidden' }), <bang>0))

        " Add an AllFiles variation that ignores .gitignore files
        command! -bang -nargs=? -complete=dir AllFiles
            \ call fzf#run(fzf#wrap('allfiles', fzf#vim#with_preview({ 'dir': <q-args>, 'sink': 'e', 'source': 'rg --files --hidden --no-ignore' }), <bang>0))

        " nmap <leader>f :GFiles --cached --others --exclude-standard<CR>
        nmap <leader>f :Files<CR>
        nmap <leader>F :AllFiles<CR>
        nmap <leader>b :Buffers<CR>
        nmap <leader>h :History<CR>
        " nmap <leader>t :BTags<CR>
        nmap <leader>l :BLines<CR>
        nmap <leader>L :Lines<CR>
        nmap <leader>' :Marks<CR>
        nmap <leader>a :AgRaw<space>
        nmap <leader>r :Rg<space>
        nmap <leader>H :Helptags!<CR>
        nmap <leader>c :Commands<CR>
        nmap <leader>: :History:<CR>
        nmap <leader>/ :History/<CR>
        nmap <leader>M :Maps<CR>
        nmap <leader>s :Filetypes<CR>
    " }}}

    " vim-rooter {{{
        Plug 'airblade/vim-rooter'
    " }}}

    " vim-which-key {{{
        " Plug 'liuchengxu/vim-which-key'
        " nnoremap <silent> <leader> :WhichKey '\'<CR>
    " }}}

    " vim-test {{{
        "Plug 'benmills/vimux'
        Plug 'vim-test/vim-test'
        " Plug 'haginaga/vim-compiler-phpunit'
        Plug 'afternoon/vim-phpunit'

        function! InteractiveZshTransform(cmd) abort
            return 'zsh -ic "'.a:cmd.'"'
        endfunction

        function! DockerTransform(cmd) abort
            return 'docker-compose exec app '.a:cmd
        endfunction

        function! HomesteadTransform(cmd) abort
            return 'cd ~/Homestead; vagrant ssh -c "cd code/wisha; '.a:cmd.'"'
        endfunction

        let g:test#custom_transformations = {
            \ 'docker': function('DockerTransform'),
            \ 'homestead': function('HomesteadTransform'),
            \ 'zsh': function('InteractiveZshTransform')
        \ }
        let g:test#transformation = 'zsh'
        let test#php#phpunit#executable = 'artisan test'

        let test#strategy = "floaterm"

        nmap <leader>tn :TestNearest<CR>
        nmap <leader>tf :TestFile<CR>
        nmap <leader>ts :TestSuite<CR>
        nmap <leader>tl :TestLast<CR>
        nmap <leader>tv :TestVisit<CR>

        "let g:test#strategy = 'dispatch' " To use quickfix
    " }}}

    " projectionist {{{
        Plug 'tpope/vim-projectionist'
    " }}}

    " vim-css-color {{{
        Plug 'ap/vim-css-color'
    " }}}

    " " nvim-colorizer.lua {{{
    "     Plug 'norcalli/nvim-colorizer.lua'
    " " }}}

    " vim-convert-color-to {{{
        Plug 'amadeus/vim-convert-color-to'
    " }}}

    " vim-sleuth {{{
        Plug 'tpope/vim-sleuth'
    " }}}

    " vim-multiple-cursors {{{
        Plug 'terryma/vim-multiple-cursors'
    " }}}

    " goyo {{{
        Plug 'junegunn/goyo.vim'
    " }}}

    " vim-agriculture {{{
        Plug 'JesseLeite/vim-agriculture'
        " nmap <Leader>/ <Plug>AgRawSearch
        " vmap <Leader>/ <Plug>AgRawVisualSelection
        " nmap <Leader>* <Plug>AgRawWordUnderCursor
    " }}}

    " vim-composer {{{
        Plug 'noahfrederick/vim-composer'
    " }}}

    " vim-laravel {{{
        Plug 'noahfrederick/vim-laravel'
    " }}}

    " coc.nvim {{{
        Plug 'neoclide/coc.nvim', {'branch': 'release'}

        let g:coc_global_extensions = [
            \ 'coc-css',
            \ 'coc-diagnostic',
            \ 'coc-emmet',
            \ 'coc-emoji',
            \ 'coc-eslint',
            \ 'coc-git',
            \ 'coc-html',
            \ 'coc-json',
            \ 'coc-pairs',
            \ 'coc-prettier',
            \ 'coc-snippets',
            \ 'coc-tailwindcss',
            \ 'coc-tslint',
            \ 'coc-tsserver',
            \ 'coc-ultisnips',
            \ 'coc-vetur',
        \ ]

        " Use tab for trigger completion with characters ahead and navigate.
        " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
        inoremap <silent><expr> <TAB>
              \ pumvisible() ? "\<C-n>" :
              \ <SID>check_back_space() ? "\<TAB>" :
              \ coc#refresh()
        inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

        function! s:check_back_space() abort
          let col = col('.') - 1
          return !col || getline('.')[col - 1]  =~# '\s'
        endfunction

        " Use <c-space> to trigger completion.
        inoremap <silent><expr> <c-tab> coc#refresh()

        " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
        " Coc only does snippet and additional edit on confirm.
        inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

        " Use `[c` and `]c` to navigate diagnostics
        nmap <silent> [c <Plug>(coc-diagnostic-prev)
        nmap <silent> ]c <Plug>(coc-diagnostic-next)

        " Remap keys for gotos
        nmap <silent> gd <Plug>(coc-definition)
        nmap <silent> gy <Plug>(coc-type-definition)
        nmap <silent> gi <Plug>(coc-implementation)
        nmap <silent> gr <Plug>(coc-references)

        " Use K to show documentation in preview window
        nnoremap <silent> K :call <SID>show_documentation()<CR>

        function! s:show_documentation()
          if (index(['vim','help'], &filetype) >= 0)
            execute 'h '.expand('<cword>')
          else
            call CocAction('doHover')
          endif
        endfunction

        " Highlight symbol under cursor on CursorHold
        augroup cochighlight
            autocmd!
            autocmd CursorHold * silent call CocActionAsync('highlight')
        augroup END

        " Remap for rename current word
        nmap <leader>rn <Plug>(coc-rename)

        " Remap for format selected region
        " xmap <leader>f  <Plug>(coc-format-selected)
        " nmap <leader>f  <Plug>(coc-format-selected)

        augroup mygroup
          autocmd!
          " Setup formatexpr specified filetype(s).
          autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
          " Update signature help on jump placeholder
          autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
        augroup end

        " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
        " xmap <leader>a  <Plug>(coc-codeaction-selected)
        " nmap <leader>a  <Plug>(coc-codeaction-selected)

        " Remap for do codeAction of current line
        " nmap <leader>ac  <Plug>(coc-codeaction)
        " Fix autofix problem of current line
        nmap <leader>qf  <Plug>(coc-fix-current)

        " Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
        nmap <silent> <TAB> <Plug>(coc-range-select)
        xmap <silent> <TAB> <Plug>(coc-range-select)
        xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

        " Use `:Format` to format current buffer
        command! -nargs=0 Format :call CocAction('format')

        " Use `:Fold` to fold current buffer
        command! -nargs=? Fold :call     CocAction('fold', <f-args>)

        " use `:OR` for organize import of current buffer
        command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

        " Using CocList
        " Show all diagnostics
        " nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
        " " Manage extensions
        " nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
        " " Show commands
        " nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
        " " Find symbol of current document
        " nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
        " " Search workspace symbols
        " nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
        " " Do default action for next item.
        " nnoremap <silent> <space>j  :<C-u>CocNext<CR>
        " " Do default action for previous item.
        " nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
        " " Resume latest coc list
        " nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
        nmap <leader>e :CocCommand explorer<CR>

        " quit vim if coc-explorer is the last window
        augroup cocexplorer
            autocmd!
            autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
        augroup END
    " }}}

    " vim-peekaboo {{{
        Plug 'junegunn/vim-peekaboo'
    " }}}

    " typescript-vim {{{
        Plug 'leafgarland/typescript-vim'
    " }}}

    " Konfekt/FastFold {{{
        Plug 'Konfekt/FastFold'
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
        "set colorcolumn=+1,81,121
    endif

    " don't display lines wrapped by default
    set nowrap

    " When wrapping, break at end of word rather than mid-word
    set linebreak

    " Show line and column numbers (only useful when statusbar not enabled)"
    set ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)

    " Restore previous buffers when starting
    "set viminfo+=%

    " Always show the sign column so things don't jump around when it appears
    set signcolumn=yes:2

    set display=lastline
    set encoding=utf-8
    set laststatus=2
    set showmatch

    " Recommended by coc.nvim README
    set updatetime=300 " default 4000

    set lazyredraw " Don't redraw the screen while performing macros (so they run faster)

    set foldcolumn=1 "Show folds in the gutter

" }}}

" Moving Around {{{
" ==============================================================================

    " Enable use of mouse in all modes with a supported terminal"
    set mouse=a

    " Highlight the line that the cursor is on
    set cursorline

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
    augroup formatting
        autocmd!
        autocmd FileType * setlocal formatoptions-=o
    augroup END

" }}}

" Tabs & Indentation {{{
" ==============================================================================

    " Use spaces instead of tabs
    "set expandtab

    " How many characters wide the tab character should be
    "set tabstop=4

    " How many spaces to use instead of a tab
    "set shiftwidth=4

    " Intelligently backspace the right number of space characters
    "set smarttab

    " Copy indent level from previous line when starting a new line
    "set autoindent

    " Seems to automatically update the indentation when a closing paren is
    " typed
    "set smartindent

    " Copy whatever characters were used to indent the previous line
    "set copyindent

    " Preserve as much of the existing indentation characters when changing
    " indentation level
    "set preserveindent

    " display tabs, tailing spaces, and other chars visually
    "set list

    set listchars=tab:▸\ ,space:·,trail:·,extends:→,precedes:←,nbsp:␣,eol:↲
    set fillchars+=fold:\ ,vert:│
    set showbreak=↪\

" }}}

" Searching {{{
" ==============================================================================

    " Highlight search matches
    set hlsearch

    " Start searching while typing
    set incsearch

    " Show what substitutions will look like real-time
    set inccommand=nosplit

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

    " Auto change directory to match current file ,cd
    nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

    "nmap <leader>l :setlocal number!<CR>:setlocal list!<CR>:silent! GitGutterToggle<CR>:silent! setlocal relativenumber!<CR>:silent! IndentLinesToggle<CR>

    "nmap <leader>c :!ctags --recurse --totals .<CR>

    " Open the current file in the default program
    nmap <leader>x :!xdg-open %<cr><cr>

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

    " xnoremap K :move '<-2<CR>gv=gv
    " xnoremap J :move '>+1<CR>gv=gv

    " Clear search highlighting
    nnoremap <silent> <leader>k :nohl<CR>

    " Visually select last pasted text using same visual mode
    nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

    " When text is wrapped, move by terminal rows, not lines, unless a count is
    " provided
    noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
    noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

    cmap w!! %!sudo tee > /dev/null %

    nmap c* *Ncgn
    vmap c* *Ncgn

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

    " noremap A <nop>

    imap ;; <Esc>A;<Esc>
    imap ,, <Esc>A,<Esc>

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

    syntax on

    if (has("termguicolors"))
        set termguicolors
    endif

    augroup ColorSchemeOverrides
        autocmd!
        autocmd ColorScheme * highlight SpellBad gui=undercurl
        autocmd ColorScheme * highlight SpellCap gui=undercurl
    augroup end

    augroup HighlightWhitespace
        autocmd!
        autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
        autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
        autocmd InsertLeave * match ExtraWhitespace /\s\+$/
    augroup end

    colorscheme dracula

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

        " Use '//' instead of '/* */' comments
        autocmd FileType php setlocal commentstring=//%s

        " autocmd FileType html setlocal foldmethod=syntax

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

    set foldlevelstart=99

" }}}

" General Auto-commands {{{
" ==============================================================================

    augroup generalautocommands
        autocmd!

        " Return to last edit position when opening files
        autocmd BufReadPost * call setpos(".", getpos("'\""))

        " Automatically re-source the .vimrc on save
        "autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw

        " Add a variation for when we edit the .vimrc while using neovim where
        " $MYVIMRC is set to init.vim
        "autocmd! BufWritePost .vimrc source % | echom "Reloaded " . $MYVIMRC | redraw


        " Use an interactive shell (to get zsh functions and aliases)
        "autocmd vimenter * let &shell='/bin/zsh -i'
    augroup end

    " Create any required directories when saving
    function s:MkNonExDir(file, buf)
        if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
            let dir=fnamemodify(a:file, ':h')
            if !isdirectory(dir)
                call mkdir(dir, 'p')
            endif
        endif
    endfunction
    augroup BWCCreateDir
        autocmd!
        autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
    augroup END

" }}}

" Speed Improvements {{{
" ==============================================================================

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

" vim: set nospell foldmethod=marker foldlevel=99:
