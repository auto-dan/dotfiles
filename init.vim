" plugins
call plug#begin()
" ui
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
" visual guides
Plug 'Yggdroot/indentLine'
" syntax checking
Plug 'w0rp/ale'
" autocomplete
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-jedi'
" formatting
Plug 'Chiel92/vim-autoformat'

call plug#end()

filetype plugin indent on


" user configs
" ui
syntax on
syntax enable

" colorscheme
let base16colorspace=256
colorscheme base16-gruvbox-dark-hard
set background=dark

" true color support
if has("termguicolors")
	set termguicolors
endif

if has("gui_running")
	set guicursor=n-v-c-sm:block,i-ci-ve:block,r-cr-o:blocks
endif

set number

set hidden
set noshowmode
set noshowmatch
set nolazyredraw

" turn off swaps and autobackups
set nobackup
set noswapfile
set nowritebackup

" search configs
set ignorecase
set smartcase

" tab & indent
set expandtab
set tabstop=4
set shiftwidth=4

" autoformat
noremap <F3> :Autoformat<CR>

" nerdtree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

autocmd VimEnter * NERDTree

" ncm2
augroup NCM2
	autocmd!
	"enable ncm2 for all buffers
	autocmd BufEnter * call ncm2#enable_for_buffer()

	" :help Ncm2PopupOpen
	set completeopt=noinsert,menuone,noselect

	" when <Enter> is used while the popup menu is visible, it will hide
	inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
augroup END

" ale
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {'python': ['flake8']}

" airline
let g:airline_left_sep  = ''
let g:airline_right_sep = ''
let g:airline#extensions#ale#enabled = 1
let airline#extensions#ale#error_symbol = 'E:'
let airline#extensions#ale#warning_symbol = 'W:'
