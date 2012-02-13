filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

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

colorscheme dante

au BufNewFile,BufRead *.tac set ft=python
