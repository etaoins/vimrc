set nocompatible

" Windows is a bit derpy
let g:pathogen_disabled = []

if has("win32")
	set gfn=Consolas:h9:cANSI
	call add(g:pathogen_disabled, 'YouCompleteMe')
end

" Pathgenize!
execute pathogen#infect()

" Show the title in the titlebar
set title

" Don't show a toolbar on Windows/GVim
set guioptions-=T

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

if !has("win32") && !has("gui_running")
	" Basically all *nix terminals support 256 colours
	set t_Co=256
endif

" Jellybeans isn't very usable with 8 colours
if has("gui_running") || &t_Co == 88 || &t_Co == 256
	colorscheme jellybeans
endif

