set nocompatible
filetype off

call plug#begin("~/.vim/plugs")
Plug 'tpope/vim-sensible'
Plug 'mattn/emmet-vim'
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim', { 'on': 'Gist' }
Plug 'itchyny/lightline.vim'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'scrooloose/syntastic'
Plug 'bronson/vim-trailing-whitespace', { 'on': 'FixWhitespace' }
Plug 'junegunn/vim-easy-align', { 'on': 'EasyAlign' }
Plug 'pangloss/vim-javascript'
Plug 'ap/vim-css-color', { 'for': 'css' }
Plug 'vim-scripts/matchit.zip'
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'haya14busa/incsearch.vim'
Plug 'pekepeke/titanium-vim'
Plug 'majutsushi/tagbar'
Plug 'airblade/vim-gitgutter'
Plug 'jamessan/vim-gnupg'
Plug 'mvrilo/github-status-vim', { 'on': 'GithubStatus' }
if has('nvim')
  Plug 'Shougo/deoplete.nvim'
else
  if has('lua')
    Plug 'Shougo/neocomplete.vim'
  else
    Plug 'Shougo/neocomplcache.vim'
  endif
endif
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/unite.vim'
Plug 'toyamarinyon/vim-swift'
Plug 'elixir-lang/vim-elixir'
Plug 'mattn/sonictemplate-vim'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/gv.vim'
call plug#end()

let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
let g:indentLine_enabled = 1

colorscheme hybrid

command! Pwd :echo expand('%:p')
command! Sudow :w! !sudo tee % >/dev/null

let mapleader = ","

" gist-vim config (most from README)
if has("mac")
  let g:gist_open_browser_after_post = 1
  let g:gist_clip_command = 'pbcopy'
endif
let g:gist_post_private = 1
let g:gist_show_privates = 1
let g:gist_detect_filetype = 1

let g:syntastic_ignore_files = ['tss']
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']

au BufRead,BufNewFile *.tss set ft=javascript " Titanium Alloy Style Files
au FileType go,python,c setl ts=8 sw=8 sts=8 noet

nmap <C-n>      :tabn<CR>
nmap <C-m>      :tabp<CR>
nmap <C-t>      :tabnew<CR>
map  <leader>q  :q<cr>
map  <leader>w  :w<cr>
map  <leader>wq :wq<cr>
nmap <silent> <leader>ev :e $MYVIMRC<cr>
nmap <silent> <leader>tv :tabnew $MYVIMRC<cr>
nmap <silent> <leader>rv :source $MYVIMRC<cr>:echo "~/.vimrc reloaded!"<cr>
nmap <silent> <leader>eb :e ~/.bash_profile<cr>
nmap <silent> <leader>tb :tabnew ~/.bash_profile<cr>
vmap <Leader>b :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>
map  <Leader>lg :<C-U>!git lg <C-R>=expand("%:p")<CR><CR>

vnoremap < <gv
vnoremap > >gv

" incsearch.vim
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
map g/ <Plug>(incsearch-stay)

set pastetoggle=<leader>z
set showmode
set wildmenu
set wildmode=list:longest
set ts=2
set sw=2
set sts=2
set expandtab
set smartindent
set wrap
set mouse=a
set cursorline
set background=dark
set number
set numberwidth=3
set ttimeoutlen=1000
set equalalways

match ErrorMsg '\%81v'
