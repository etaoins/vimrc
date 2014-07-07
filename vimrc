set nocompatible

" Pathgenize!
execute pathogen#infect()

" Show the title in the titlebar
set title

syntax on

" Indent/tab stuff
set autoindent
set tabstop=4
set shiftwidth=4

set bs=2

" Search stuff
set nohlsearch
set incsearch

" Nice tab complete
set wildmenu

" This seems more natural
set splitbelow
set splitright

" Use the mouse
set mouse=a

" Try relative line numbers
set number
set relativenumber

" Show the ruler
set ruler

filetype on
filetype plugin on
filetype indent on

let g:syntastic_php_checkers=['php']
let g:syntastic_javascript_checkers=['jshint']
let g:syntastic_javascript_jshint_config="~/.jshintrc"

let g:syntastic_c_checkers=[]
let g:syntastic_cpp_checkers=[]

let g:ycm_extra_conf_globlist = ['~/Code/*']
let g:ycm_enable_diagnostic_signs=0

augroup filetype
	au! BufRead,BufNewFile *.ll set filetype=llvm
augroup END

set t_Co=256
colorscheme jellybeans
