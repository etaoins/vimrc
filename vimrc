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
set smarttab
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

if has("gui_running")
	set mouse=a
else
	" Terminal.app supports mice but Vim eats all mouse events making it
	" difficult to copy path names from the status line.
	set mouse=
endif

" Try relative line numbers
set number
set relativenumber

" Show the ruler
set ruler

" Highlight the current cursor line
set cursorline

" Parse .md files as Markdown, not Modula
au BufRead,BufNewFile *.md set filetype=markdown

filetype on
filetype plugin on
filetype indent on

let g:syntastic_php_checkers=['php']
let g:syntastic_javascript_checkers=['jshint']
let g:syntastic_javascript_jshint_config="~/.jshintrc"

" Invoking scalac is quite expensive even on a fast computer and this can
" cause Vim to lag. Instead just depend on sbt's change detection.
let g:syntastic_scala_checkers=[]

" javac doesn't support syntax-only parsing
" These means the classpath etc. has to be configured correctly which is very
" unlikely. Otherwise it will spew a lot of bogus errors
let g:syntastic_java_checkers=[]

" Use coffeelint for CoffeeScript
let g:syntastic_coffee_checkers=['coffeelint']

let g:ycm_extra_conf_globlist = ['~/Code/*']

if !has("win32") && !has("gui_running")
	" Basically all *nix terminals support 256 colours
	set t_Co=256
endif

" Jellybeans isn't very usable with 8 colours
if has("gui_running") || &t_Co == 88 || &t_Co == 256
	colorscheme jellybeans
endif

" Nobody wants ex mode
map Q <Nop>

" Always show the statusline with a subset of the airline extensions
set laststatus=2
let g:airline_extensions = ['branch', 'quickfix', 'syntastic', 'hunks']

" Use git ls-files for much faster CtrlP
let g:ctrlp_user_command = 'git ls-files --others --cached --exclude-standard %s'
