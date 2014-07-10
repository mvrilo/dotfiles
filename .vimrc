set nocompatible

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'mattn/emmet-vim'
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
Bundle 'itchyny/lightline.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-dispatch'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-endwise.git'
Bundle 'tpope/vim-fugitive'
Bundle 'vim-ruby/vim-ruby'
Bundle 'flazz/vim-colorschemes'
Bundle 'scrooloose/syntastic'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'junegunn/vim-easy-align'
Bundle 'pangloss/vim-javascript'
Bundle 'ap/vim-css-color'
Bundle 'jQuery'
Bundle 'vim-scripts/matchit.zip'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'fatih/vim-go'
Bundle 'kchmck/vim-coffee-script'
Bundle 'groenewege/vim-less'
Bundle 'mvrilo/github-status-vim'

colorscheme ir_black

command! SortCSS :g#\({\n\)\@<=#.,/}/sort
command! Pwd :echo expand('%:p')
command! Sudow :w! !sudo tee % >/dev/null

"let g:syntastic_check_on_open=1
let g:go_fmt_command = "gofmt" "goimports
let mapleader = "\<Space>"

" gist-vim config (most from README)
if has("mac")
  let g:gist_open_browser_after_post = 1
  let g:gist_clip_command = 'pbcopy'
endif
let g:gist_post_private = 1
let g:gist_show_privates = 1
let g:gist_detect_filetype = 1

au FileType go,python,c setl ts=4 sw=4 sts=4 noet

highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)
au BufNewFile,BufRead * call matchadd('ColorColumn', '\%81v', 100)

nnoremap ; :
nmap <F1> <Esc>
nmap <A-Left>   :tabp<CR>
nmap <A-Right>  :tabn<CR>
nmap <C-n>      :tabn<CR>
nmap <C-m>      :tabp<CR>
nmap <C-t>      :tabnew<CR>
nnoremap <silent> <C-L> :nohlsearch<CR><C-L>

map  <leader>q  :q<cr>
map  <leader>w  :w<cr>
map  <leader>wq :wq<cr>
nmap <silent> <leader>ev :e $MYVIMRC<cr>
nmap <silent> <leader>tv :tabnew $MYVIMRC<cr>
nmap <silent> <leader>rv :source $MYVIMRC<cr>:echo "~/.vimrc reloaded!"<cr>
nmap <silent> <leader>eb :e ~/.bash_profile<cr>
nmap <silent> <leader>tb :tabnew ~/.bash_profile<cr>

if executable('git')
  vmap <Leader>b :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>
  map  <Leader>lg :<C-U>!git lg <C-R>=expand("%:p")<CR><CR>
  map  <Leader>gd :<C-U>!git diff <C-R>=expand("%:p")<CR><CR>
endif

"Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  set grepprg=ag\ --nogroup
endif

set pastetoggle=<leader>z
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
set ttimeout
set ttimeoutlen=2000
set autoread
set cm=blowfish
syntax on
filetype plugin indent on
