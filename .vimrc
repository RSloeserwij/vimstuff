set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
" Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'morhetz/gruvbox'
Plugin 'wesQ3/vim-windowswap'
Plugin 'Shougo/vimshell'
Plugin 'Shougo/vimproc'
Plugin 'vim-scripts/dbext.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-scripts/Tabmerge'

" Java
Plugin 'scrooloose/nerdtree'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"Basic Settings
:colorscheme gruvbox
:set background=dark
:set number
:set mouse=a
:set nowrap
syntax on

"Key mapping
nmap <C-Y> :call WindowSwap#EasyWindowSwap()<CR>
nmap <C-d> :NERDTreeToggle<CR>
nmap <F7> :tabp<CR>
nmap <F8> :tabn<CR>



"Systaxi
let g:sql_type_default = "sqlinformix"

"tabs
set tabstop=2
set softtabstop=0 noexpandtab
set shiftwidth=2
set smarttab

"commands
command Apps1 :e scp://rsloeserwij@145APPS01/~/
command Apps2 :e scp://rsloeserwij@145APPS02/~/
command Apps3 :e scp://rsloeserwij@145APPS03/~/
command Dbs02 :e scp://rsloeserwij@145DBS02/~/

"This command will insert the text in ~/.vim/header into the current buffer
"At the position of the cursor
command Header :r ~/.vim/header
command SanitizeHex :%s/\d[0-9a-f]\s.\s//g

