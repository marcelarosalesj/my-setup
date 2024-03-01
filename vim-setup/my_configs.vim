" ~/.vim_runtime/my_configs.vim

call pathogen#infect()
syntax on
filetype plugin indent on

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
let NERDTreeShowHidden=1


" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>
map <leader>g :Ack

" Marcela vimrc
inoremap jj <ESC>
set number
set colorcolumn=88
filetype plugin indent on
" colorscheme ron
nnoremap <F3> :set hlsearch!<CR>

nnoremap <leader>p Oimport ipdb; ipdb.set_trace()<Esc>
