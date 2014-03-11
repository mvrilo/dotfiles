set nocompatible

filetype off
set rtp+=$GOROOT/misc/vim/
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
filetype plugin indent on

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-surround'
Bundle 'mattn/emmet-vim'
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
Bundle 'vim-ruby/vim-ruby'
Bundle 'ervandew/supertab'
Bundle 'ap/vim-css-color'
Bundle 'scrooloose/syntastic'
Bundle 'itchyny/lightline.vim'
Bundle 'junegunn/vim-easy-align'
Bundle 'pangloss/vim-javascript'
Bundle 'flazz/vim-colorschemes'
Bundle 'kien/ctrlp.vim'
Bundle 'jQuery'

colorscheme dante

command! SortCSS :g#\({\n\)\@<=#.,/}/sort
command! Pwd :echo expand('%:p')

"let g:syntastic_check_on_open=1
let g:gofmt_command = "goimports"
let mapleader = ","

" gist-vim config (most from README)
if has("mac")
  let g:gist_open_browser_after_post = 1
  let g:gist_clip_command = 'pbcopy'
endif
let g:gist_post_private = 1
let g:gist_show_privates = 1
let g:gist_detect_filetype = 1

au BufWritePre *.go :silent Fmt
au BufWritePost .vimrc source %
au BufWritePre *.rb,*.html*,*.js,*.css* silent! %s/\s*$//|''
au FileType python,c setl ts=4 sw=4 sts=4 noet
au FileType go setl ts=8 sw=8 sts=8 noet

nmap <F1> <Esc>
nmap <A-Left>   :tabp<CR>
nmap <A-Right>  :tabn<CR>
nmap <C-n>      :tabn<CR>
nmap <C-p>      :tabp<CR>
nmap <C-t>      :tabnew<CR>

map  <Leader>wqa :wqa!<cr>
map  <Leader>wq  :wq!<cr>
map  <Leader>wa  :wa!<cr>
map  <Leader>w   :w!<cr>
nmap <Leader>/   :nohlsearch<CR>

if executable('git')
  vmap <Leader>b :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>
  map <Leader>lg :<C-U>!git lg <C-R>=expand("%:p")<CR><CR>
  map <Leader>gd :<C-U>!git diff <C-R>=expand("%:p")<CR><CR>
endif

"Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  set grepprg=ag\ --nogroup
endif

set showcmd
set showmode
set showmatch

set wildmenu
set wildmode=list:longest
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
set laststatus=2
syntax on
