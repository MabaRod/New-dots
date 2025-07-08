filetype on
syntax on
filetype plugin on
filetype indent on
colorscheme synthwave

"mappings"
let mapleader = " "
" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
call plug#begin()
Plug 'artanikin/vim-synthwave84'
Plug 'preservim/nerdtree'
Plug 'vimwiki/vimwiki'
Plug 'junegunn/fzf', { 'dir': '~/.fzf' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <leader>h :terminal<CR>
