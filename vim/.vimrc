" Make sure you use single quotes
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'         " fancy statusline
Plug 'vim-airline/vim-airline-themes'  " themes for airline
Plug 'ctrlpvim/ctrlp.vim'              " add ctlp plugin for searching
Plug 'airblade/vim-gitgutter'          " Shows a git diff in the gutter (sign column) and stages/undoes hunks.
Plug 'tpope/vim-commentary'            " easy commenting
Plug 'raimondi/delimitmate'            " Auto close tags
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }    " visual file explorer
Plug 'Xuyuanp/nerdtree-git-plugin'                                          " git changes for nerdtree
Plug 'ryanoasis/vim-devicons'                                               " file icons for nerdtree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'                              " syntax highlighting for nerdtree
Plug 'brooth/far.vim'                  " find and replace with :Far foo bar **/*.scss -then- :Fardo
" Syntax support
Plug 'othree/html5.vim'                                       " html5 syntax
Plug 'othree/javascript-libraries-syntax.vim'                 " javascript libary syntax (jquery)
Plug 'pangloss/vim-javascript'                                " javascript syntax
Plug 'cakebaker/scss-syntax.vim'                              " scss syntax
Plug 'lumiliet/vim-twig'                                      " twig syntax
Plug 'jtratner/vim-flavored-markdown'                         " markdown syntax
" Syntax Engines
Plug 'w0rp/ale'
" Auto Complete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'  } " Autocompletion engine
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'mattn/emmet-vim'                                        " html / templates
Plug 'ervandew/supertab'                                      " Perform all your vim insert mode completions with Tab
" Snippets
Plug 'sirver/ultisnips'                                       " snippet engine
Plug 'honza/vim-snippets'                                     " collection of snippets

" Initialize plugin system
call plug#end()

" General Config
syntax enable             " enable syntax processing
filetype plugin on        " load filetype-specific indent files
filetype indent on
set encoding=utf8         " set encoding
set t_Co=256              " explicitly tell vim that the terminal supports 256 colors
set ttyfast               " faster redrawing
set iskeyword+=-          " include - in keyword matching
set backspace=indent,eol,start "  backspace over everything in insert mode

" Auto Commands
" auto reload file when changed on disk
set updatetime=750
au CursorHold,FocusGained,BufEnter * checktime

" Leader Shortcuts
" set a map leader for more key combos
let mapleader = ','
" shortcut to save
nmap <leader>, :w<cr>
" shortcut for CtrlP search
nmap <leader>f :CtrlP<cr>
" open v split
nmap <leader>v :vsp<cr>
" open h split
nmap <leader>h :sp<cr>
" open current dir in finder
nmap <leader>o :!open .<cr>>
" remap emmet expand
imap hh <C-y>,

" reindent entire file
" mark cursor and put cursor back, center cursor in window
nnoremap <leader>r magg=G`az.
" Display current file in the NERDTree ont the left
nmap <silent> <leader>n :NERDTreeFind<CR><c-w>=
" super save - save session in its current state, open agian with `vim -S`
nnoremap <leader>s :mksession!<CR>>

" leader w, for pane control
nnoremap <leader>w <C-w>
" focus splits with ctrl + direction
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
" make deoplete with with ultisnips
call deoplete#custom#set('ultisnips', 'matchers', ['matcher_fuzzy'])

" UltiSnips  
" set default shortcut
let g:UltiSnipsExpandTrigger='<tab>'

" load custom snippets location
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"
let g:UltiSnipsEditSplit='vertical'

" SuperTab  
let g:SuperTabDefaultCompletionType = "<c-n>"

" CtrlP - searching in your current directory only
let g:ctrlp_working_path_mode = '0'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" NERDTree
map <C-n> :NERDTreeToggle<CR><c-w>=
let NERDTreeShowHidden=1
let NERDTreeDirArrowExpandable = '▷'
let NERDTreeDirArrowCollapsible = '▼'
" Disable bookmarks label, and hint about '?'
let NERDTreeMinimalUI=1
" colorize full name in addition to icon
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeIgnore = ['\.DS_Store$','node_modules','\.swp$','\.swo$','\~$']

" DelimitMate
if has('nvim')
let delimitMate_expand_cr = 1
endif
let delimitMate_expand_space = 1

" Searching
set ignorecase   " ignore case in search patterns
set smartcase    " poverride the 'ignorecase' option if the search pattern contains upper case characters
set incsearch    " search as characters are entered
set hlsearch     " highlight matches

" Spaces & Tabs
set tabstop=4             " number of visual spaces per TAB
set shiftwidth=2          " number of spaces to use for indent and unindent
set expandtab             " tabs are spaces

"  UI
set nowrap               " dont wrap long lines
set hidden               " hide buffers, dont unload them, this fixes losing syntax on buffer change
set number               " show line numbers
set relativenumber       " use relative lines
set title                " show file name in window title
set cursorline           " highlight line with cursor
set showmatch            " show matching brackets
set matchpairs+=<:>      " make < and > match as well
set mouse=a              " enable mouse for scrolling
set showcmd              " show current command in bottom right
set laststatus=2         " always show airline
set list                      " show invisible characters
set listchars=tab:→\ ,trail:⋅ " list chars
set fillchars=vert:│          " set vert split character to taller line
set autoindent            " automatically set indent of new line
set smartindent           " do smart autoindenting when starting a new line
set autoread              " auto reload changed files

" colorscheme
set background=dark

" gruvbox setup
colorscheme gruvbox

if has('termguicolors')
  set termguicolors " 24-bit terminal
endif

" Airline
let g:airline_theme='gruvbox'

