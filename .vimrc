filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

colorscheme dante

set nocompatible

set showcmd
set showmode
set showmatch

set wildmenu
set incsearch
set hlsearch

set ts=2
set sw=2
set sts=2

au FileType python setl ts=4 sw=4 sts=4 noet
au FileType c setl ts=4 sw=4 sts=4 noet
au FileType go setl ts=8 sw=8 sts=8 noet

set expandtab
set autoindent
set smartindent
set backspace=indent,eol,start

set wrap
set ruler
set mouse=a
set cursorline
set background=dark
set number
set numberwidth=3
set laststatus=2
set statusline=\ %F\ %m%r%y\ \ \ %=[%c\ -\ %l\/%L\ (\%p%%)\ lines\ \|\ %P]\ 
syntax on

" Tab mappings
nmap <A-Left> :tabp<CR>
nmap <A-Right> :tabn<CR>
nmap <C-n> :tabn<CR>
nmap <C-p> :tabp<CR>
nmap <C-t> :tabnew<CR>

" No help
nmap <F1> <Esc>

" SortCSS attributes of a file inside each block
command! SortCSS :g#\({\n\)\@<=#.,/}/sort 

au BufNewFile,BufRead *.tac set ft=python
au! BufWritePost .vimrc source %
au BufWritePre *.go :silent Fmt

hi StatusLine ctermbg=white ctermfg=darkgrey
