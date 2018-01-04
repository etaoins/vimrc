call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'derekwyatt/vim-scala'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'leafgarland/typescript-vim'
Plug 'nanotech/jellybeans.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline-themes'
Plug 'rust-lang/rust.vim'
Plug 'w0rp/ale'
Plug 'fatih/vim-go'
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-go'
Plug 'sebastianmarkow/deoplete-rust'

call plug#end()

" Don't show a toolbar on Windows/GVim
set guioptions-=T

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

" Highlight the current cursor line
set cursorline

let g:ale_linters = {
\   'php': ['php'],
\   'go': ['go build'],
\   'javascript': ['eslint'],
\   'typescript': ['tslint'],
\   'scala': [],
\   'java': [],
\   'coffee': ['coffeelint'],
\}

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Jellybeans isn't very usable with 8 colours
if has("gui_running") || &t_Co == 88 || &t_Co == 256
	colorscheme jellybeans
	highlight Normal ctermbg=black
endif

" Nobody wants ex mode
map Q <Nop>

" Emulate ctrlp with fzf
nmap <c-p> :execute "FZF" systemlist('git rev-parse --show-toplevel 2> /dev/null \|\| pwd')[0]<CR>
let g:fzf_layout = { 'window': '10split enew' }
let $FZF_DEFAULT_COMMAND = 'rg --files'

" Hide the status line in fzf
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" Always show the statusline with a subset of the airline extensions
set laststatus=2
let g:airline_extensions = ['branch', 'quickfix', 'ale', 'hunks']

" Some plugins don't like fish
set shell=bash

" Autocomplete on tab
let g:deoplete#enable_at_startup = 1
inoremap <silent><expr> <TAB>
		\ pumvisible() ? "\<C-n>" :
		\ <SID>check_back_space() ? "\<TAB>" :
		\ deoplete#mappings#manual_complete()
		function! s:check_back_space() abort "{{{
		let col = col('.') - 1
		return !col || getline('.')[col - 1]  =~ '\s'
		endfunction"}}}

let g:rustfmt_autosave = 1
let g:rustfmt_command = "rustfmt"

let g:deoplete#sources#rust#racer_binary=$HOME . "/.cargo/bin/racer"
