" Sane vim defaults for ArchLabs

" Arch defaults
"runtime! archlinux.vim
set encoding=utf8
set nocompatible
set smartindent
set backspace=indent,eol,start
set ruler
set showcmd
set incsearch
set hlsearch 
set modeline
set relativenumber          " enable relative number"
"set clipboard^=unnamedplus  " system clipboard (requires +clipboard)
set clipboard=unnamed
set number                  " enable line numbers
set confirm                 " ask confirmation for some things, like save before quit, etc.
set wildmenu                " Tab completion menu when using command mode
set expandtab               " Tab key inserts spaces not tabs
set softtabstop=2          " spaces to enter for each tab
set shiftwidth=2            " amount of spaces for indentation
set shortmess+=aAcIws       " Hide or shorten certain messages

" enable mouse.. sgr is better but not every term supports it
set mouse=a
if has('mouse_sgr')
    set ttymouse=sgr
endif

" syntax highlighting with true colors in the terminal
syntax enable
if has('termguicolors') && $DISPLAY !=? ''
    set termguicolors
endif

" paste while in insert mode
inoremap <silent><C-v> <Esc>:set paste<CR>a<C-r>+<Esc>:set nopaste<CR>a

" alt defaults
nnoremap 0 ^
nnoremap Y y$
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <Tab> ==j

" j=gj k=gk but preserve numbered jumps ie. 12j or 30k
nnoremap <buffer><silent><expr>j v:count ? 'j' : 'gj'
nnoremap <buffer><silent><expr>k v:count ? 'k' : 'gk'

" Reload changes if file changed outside of vim requires autoread
augroup load_changed_file
    autocmd!
    autocmd FocusGained,BufEnter * if mode() !=? 'c' | checktime | endif
    autocmd FileChangedShellPost * echo "Changes loaded from file"
augroup END

" when quitting a file, save the cursor position
augroup save_cursor_position
    autocmd!
    autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim


filetype off
"-------------- PLUGINS STARTS -----------------
call plug#begin()

Plug 'VundleVim/Vundle.vim'
Plug 'fatih/vim-go'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'majutsushi/tagbar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-scripts/a.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'svermeulen/vim-easyclip'
Plug 'Raimondi/delimitMate'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jez/vim-c0'
Plug 'jez/vim-ispc'
Plug 'kchmck/vim-coffee-script'
Plug 'flazz/vim-colorschemes'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'vim-syntastic/syntastic'
" Track the engine.
Plug 'SirVer/ultisnips'
Plug 'wesQ3/vim-windowswap'
Plug 'Yggdroot/indentLine'
Plug 'digitaltoad/vim-pug'
Plug 'nsf/gocode', {'rtp': 'vim/'}
" from mas rud
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'myusuf3/numbers.vim'
Plug 'easymotion/vim-easymotion'
Plug 'rking/ag.vim'
Plug 'airblade/vim-gitgutter'
Plug 'prettier/vim-prettier', {
            \ 'do': 'yarn install',
            \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'javascript.jsx'] }
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
Plug 'othree/html5.vim'
Plug 'xolox/vim-misc'
Plug 'ludovicchabant/vim-gutentags'
call plug#end()  
"-------------- PLUGINS END --------------------
filetype on
"filetype plugin indent on


"----- GENERAL SETTINGS-------
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_detect_paste=1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='murmur'
set background=dark
let g:solarized_termcolors=256
colorscheme solarized
" Configure symbol
if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<enter+ctrl>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"---------NERD-TREE SETTINGS----------
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_console_startup = 1
map <C-n> :NERDTreeToggle<CR>
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>

"-------- SYNTASTIC SETTINGS---------
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"

augroup mySyntastic
    au!
    au FileType tex let b:syntastic_mode = "passive"
augroup END


"-------- TAGS SETTINGS --------------------------------
"let g:easytags_events = ['BufReadPost', 'BufWritePost']
"let g:easytags_async = 1
"let g:easytags_dynamic_files = 2
"let g:easytags_resolve_links = 1
"let g:easytags_suppress_ctags_warning = 1
"let g:tagbar_autoclose=2

"nmap <silent> <leader>b :TagbarToggle<CR>
"
"autocmd BufEnter * nested :call tagbar#autoopen(0)
"autocmd FileType javascript setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab


"---------GIT SETTINGS--------------
hi clear SignColumn
let g:airline#extensions#hunks#non_zero_only = 1


"----------DELIMITEMATE SETTINGS-----------------
let delimitMate_expand_cr = 1
augroup mydelimitMate
    au!
    au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
    au FileType tex let b:delimitMate_quotes = ""
    au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
    au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

"-----------TMUX SETTINGS--------------
let g:tmux_navigator_save_on_switch = 2

"Undo and redo multiple file
let vimDir = '$HOME/.vim/backup/'

if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')

    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif

" Syntastic "
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_go_checkers = ['govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

" Vim-go
" GoLang settings.
autocmd FileType go nmap <Leader>gdc <Plug>(go-doc)
autocmd FileType go nmap <Leader>goi <Plug>(go-info)

autocmd FileType go nnoremap <Leader>god :GoDecls<CR>
autocmd FileType go nnoremap <Leader>gor :GoDeclsDir<CR>
autocmd FileType go nnoremap <Leader>gsi :GoSameIds<CR>
autocmd FileType go nnoremap <Leader>gsc :GoSameIdsClear<CR>
let g:go_list_type = "quickfix"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_highlight_extra_types = 1
let g:go_highlight_structs = 1
let g:go_highlight_generate_tags = 1

" Vim JSX
" JSX syntax highlighting support only on .jsx file extension by default. This
" configuration is to enable jsx syntax highlighting on .js files too.
let g:jsx_ext_required = 0

"let g:deoplete#enable_at_startup = 1
"let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
"let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

let g:javascript_plugin_jsdoc = 1
"tagbar
nmap <F8> :TagbarToggle<CR>
" cTags from https://stackoverflow.com/questions/563616/vim-and-ctags-tips-and-tricks
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" vim go tag bar 
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }
