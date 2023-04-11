call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
Plug 'nanotech/jellybeans.vim'
Plug 'chr4/nginx.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline-themes'
Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go'
Plug 'rhysd/vim-llvm'
Plug 'hashivim/vim-terraform'
Plug 'jparise/vim-graphql'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jxnblk/vim-mdx-js'

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

" Write swap files & update Git gutters more frequently
set updatetime=250

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

" Emulate ctrlp with telescope
nmap <c-p> <cmd>Telescope find_files<cr>

" Always show the statusline with a subset of the airline extensions
set laststatus=2
let g:airline_extensions = ['branch', 'quickfix', 'hunks', 'coc']

" Some plugins don't like fish
set shell=bash

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> <C-k> <Plug>(coc-diagnostic-prev)
nmap <silent> <C-j> <Plug>(coc-diagnostic-next)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Format whole buffer
command! -nargs=0 Format :call CocAction('format')

" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

let g:rustfmt_autosave = 1
let g:rustfmt_command = "rustfmt"
let g:rustfmt_fail_silently = 1
