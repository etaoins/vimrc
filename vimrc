call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'derekwyatt/vim-scala'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'nanotech/jellybeans.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline-themes'
Plug 'rust-lang/rust.vim'
Plug 'leafgarland/typescript-vim'
Plug 'fatih/vim-go'
Plug 'rhysd/vim-llvm'

call plug#end()

" Don't show a toolbar on Windows/GVim
set guioptions-=T

" Make backspace work as expected on all builds (i.e. `brew install vim`)
set backspace=2

" The default tabstop of 8 is pretty intense
set tabstop=4
set shiftwidth=4

" Don't persist search highlights after search
set nohlsearch

" This seems more natural
set splitbelow
set splitright

" Use the mouse
set mouse=a

" Use relative line numbers
set number
set relativenumber

" Don't cause Git churn with correcting newlines
set nofixendofline

" Highlight the current cursor line
set cursorline

" Jellybeans isn't very usable with 8 colours
if has("gui_running") || &t_Co == 88 || &t_Co == 256
	" Ignore errors when we haven't :PlugInstall'ed yet
	try
		colorscheme jellybeans
		highlight Normal ctermbg=black
	catch /^Vim\%((\a\+)\)\=:E185/
		" Do nothing
	endtry
endif

" Nobody wants ex mode
map Q <Nop>

" u is "undo" in normal mode but "lowercase selection" in visual mode
" This is easy to fat finger so disable it and its uppercase counterpart
xmap u <Nop>
xmap U <Nop>

" Emulate ctrlp with fzf
nmap <c-p> :execute "FZF" systemlist('git rev-parse --show-toplevel 2> /dev/null \|\| pwd')[0]<CR>
let g:fzf_layout = { 'window': '10split enew' }
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'

" Hide the status line in fzf
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" Always show the statusline with a subset of the airline extensions
set laststatus=2
let g:airline_extensions = ['branch', 'quickfix', 'hunks']

" Some plugins don't like fish
set shell=bash

let g:rustfmt_autosave = 1
let g:rustfmt_command = "rustfmt"
let g:rustfmt_fail_silently = 1
