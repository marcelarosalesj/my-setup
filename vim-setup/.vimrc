
set exrc
set secure

set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

set runtimepath+=~/.vim_runtime

set number
"colorscheme zellner
colorscheme ron
set colorcolumn=79

"source ~/.vim/plugin/linuxsty.vim

augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END


filetype plugin indent on

"let g:linuxsty_patterns = [ "/usr/src/", "/linux", "~/Repos/daos" ]

" exit insertion mode with jj
inoremap jj <ESC>
