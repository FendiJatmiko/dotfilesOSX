" set Somethin
set nocompatible               " be improved, required
filetype off                   " required
set rtp+=~/.config/nvim/bundle/Vundle.vim
" Vundle Begin
call plug#begin('~/.config/nvim/plugged')

Plug 'VundleVim/Vundle.vim'
Plug 'fatih/vim-go'
"Plug 'Valloric/YouCompleteMe'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree'
Plug  'scrooloose/nerdcommenter'
Plug  'jistr/vim-nerdtree-tabs'
Plug  'majutsushi/tagbar'
Plug  'ctrlpvim/ctrlp.vim'
Plug  'vim-scripts/a.vim'
Plug  'tpope/vim-fugitive'
Plug  'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug  'svermeulen/vim-easyclip'
Plug  'Raimondi/delimitMate'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jez/vim-c0'
Plug 'jez/vim-ispc'
Plug 'kchmck/vim-coffee-script'
Plug 'flazz/vim-colorschemes'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'vim-syntastic/syntastic'
Plug 'kaicataldo/material.vim'
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
Plug 'zchee/deoplete-go'
Plug 'mdempsky/gocode', { 'rtp' : 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
Plug 'joshdick/onedark.vim'

call plug#end()

filetype plugin indent on

" set the runtime path to include Vundle and initialize
set ruler
set relativenumber
set ttyfast
set autoread
set autoindent
set backspace =indent,eol,start
set background = "dark"
set laststatus=2
set noerrorbells
set number
set splitright
set splitbelow
set fileformats=unix,dos,mac
set noshowmatch
set noshowmode
set nocursorcolumn
set cursorline
set lazyredraw
set noet nowrap tw=0 ww=0
set tabstop=2 softtabstop=2 expandtab shiftwidth=2 smarttab
set nobackup
set pastetoggle=<F5>
set scrolloff=5
set termguicolors
" True color support
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"" ColorScheme
colorscheme onedark

" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.config/nvim'
let &runtimepath.=','.vimDir

"---------NERD-TREE SETTINGS----------
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_console_startup = 1
map <C-n> :NERDTreeToggle<CR>
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif

" Vim status line settings
let g:airline_powerline_fonts = 1
let g:airline_theme = 'simple'
"let g:material_theme_style = 'default' | 'palenight' | 'dark'
" Populate proper symbol font
let g:airline_powerline_fonts = 1
" Configure symbol
if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif

" Ctrlp-funky highlight syntax
let g:ctrlp_funky_syntax_highlight = 1
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.class
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" Use Ag over Grep.
set grepprg=ag\ --nogroup\ --nocolor
"let g:ctrlp_user_command = 'ag %s -l --nocolor'
let g:ctrlp_user_command = {
            \ 'types': {
            \ 1: ['.git', 'cd %s && git ls-files'],
            \ 2: ['.hg', 'hg --cwd %s locate -I .'],
            \ },
            \ 'fallback': 'ag %s -l --nocolor --nogroup --hidden
            \ --ignore out
            \ --ignore .git
            \ --ignore .svn
            \ --ignore .hg
            \ --ignore .DS_Store
            \ --ignore "**/*.pyc"
            \ -g ""'
            \ }

let g:ctrlp_match_window = 'max:20,results=100'

let mapleader = ','

" Show invisible characters.
set listchars=eol:¬,tab:»\ ,trail:·,extends:›,precedes:‹,nbsp:·
set list

" Map Keys.
nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnew<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>

nnoremap nt  :NERDTreeToggle<CR>

nnoremap <F4> :set hlsearch!<CR>

nnoremap <Leader>yy :set clipboard=unnamedplus<CR>
nnoremap <Leader>yc :set clipboard=<CR>

" GoLang settings.
autocmd FileType go nmap <Leader>gdc <Plug>(go-doc)
autocmd FileType go nmap <Leader>goi <Plug>(go-info)

autocmd FileType go nnoremap <Leader>god :GoDecls<CR>
autocmd FileType go nnoremap <Leader>gor :GoDeclsDir<CR>
autocmd FileType go nnoremap <Leader>gsi :GoSameIds<CR>
autocmd FileType go nnoremap <Leader>gsc :GoSameIdsClear<CR>

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_structs = 1
let g:go_highlight_generate_tags = 1

let g:go_auto_type_info = 1

let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"
let g:go_fmt_autosave = 0
let g:go_def_mode = "godef"

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

let g:javascript_plugin_jsdoc = 1

" Let <Tab> also do completion
inoremap <silent><expr> <Tab>
\ pumvisible() ? "\<C-n>" :
\ deoplete#mappings#manual_complete()

" Close the documentation window when completion is done
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
