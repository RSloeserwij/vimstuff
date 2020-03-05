set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
Plugin 'VundleVim/Vundle.vim'

" GIT
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" SYNTAX
Plugin 'scrooloose/syntastic'
Plugin 'chase/vim-ansible-yaml'		" ansible-yaml syntax/ftdetect/ftplugin
Plugin 'Yggdroot/indentLine'			" show identation lines

" COLORSCHEME
Plugin 'morhetz/gruvbox'
Plugin 'guns/xterm-color-table.vim'

" VIM MANAGEMENT
Plugin 'scrooloose/nerdtree'			" file-tree
Plugin 'ascenator/L9'							" vimscript

" WINDOW / TAB MANAGEMENT
Plugin 'wesQ3/vim-windowswap'
Plugin 'vim-scripts/Tabmerge'
Plugin 'majutsushi/tagbar'

" STATUS BAR
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin on
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
:set t_Co=256
:set background=dark
:set ttymouse=xterm2
:set cursorline
:set number
:set mouse=a
:set nowrap
syntax on

"Custom Visual Settings
try
	:colorscheme gruvbox
	let g:airline_theme='angr'
catch
	echo "could not access custom plugins yet."
endtry

"Custom Syntastic Settings
try
	set statusline+=%#warningmsg#
	set statusline+=%{SyntasticStatuslineFlag()}
	set statusline+=%*

	let g:syntastic_always_populate_loc_list=1
	let g:syntastic_loc_list_height=5
	let g:syntastic_auto_loc_list=0
	let g:syntastic_check_on_open=1
	let g:syntastic_check_on_wq=1

	let g:syntastic_error_symbol = 'X'
	let g:syntastic_style_error_symbol = '⁉️'
	let g:syntastic_warning_symbol = '⚠️'
	let g:syntastic_style_warning_symbol = '💩'

	highlight link SyntasticErrorSign SignColumn
	highlight link SyntasticWarningSign SignColumn
	highlight link SyntasticStyleErrorSign SignColumn
	highlight link SyntasticStyleWarningSign SignColumn
catch
	echo "failed to configure syntastic"
endtry

"Custom indentLine Settings
let g:indentLine_color_term = 238
let g:indentLine_char = '┊'


"Key mapping
inoremap jj <esc>
nmap <C-Y> :call WindowSwap#EasyWindowSwap()<CR>
nmap <C-d> :NERDTreeToggle<CR>
nmap <F6> :TagbarToggle<CR>
nmap <F7> :tabp<CR>
nmap <F8> :tabn<CR>
nmap <F9> :call utils#Execute()<CR>

nnoremap <C-M-LEFT> 	<C-W><C-H>
nnoremap <C-M-UP>			<C-W><C-K>
nnoremap <C-M-DOWN>		<C-W><C-J>
nnoremap <C-M-RIGHT> 	<C-W><C-L>

"Systaxi
let g:sql_type_default = "sqlinformix"

"tabs
set tabstop=2
set softtabstop=0 noexpandtab
set shiftwidth=2
set smarttab

"This command will insert the text in ~/.vim/header into the current buffer
"At the position of the cursor
command! SanitizeHex :%s/\d[0-9a-f]\s.\s//g
command! SudoWrite :w !sudo dd of=%
