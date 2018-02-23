" Make sure you use single quotes
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'         " fancy statusline
Plug 'vim-airline/vim-airline-themes'  " themes for airline
Plug 'ctrlpvim/ctrlp.vim'              " add ctlp plugin for searching
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

" CtrlP - searching in your current directory only
let g:ctrlp_working_path_mode = '0'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

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

