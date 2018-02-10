set nocompatible
filetype off

call plug#begin("~/.vim/plugs")
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'tpope/vim-sensible'
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

Plug 'mattn/emmet-vim'
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim', { 'on': 'Gist' }
Plug 'itchyny/lightline.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'scrooloose/nerdtree'
Plug 'bronson/vim-trailing-whitespace', { 'on': 'FixWhitespace' }
Plug 'junegunn/vim-easy-align', { 'on': 'EasyAlign' }
Plug 'pangloss/vim-javascript'
Plug 'ap/vim-css-color', { 'for': 'css' }
Plug 'vim-scripts/matchit.zip'
Plug 'fatih/vim-go'
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'haya14busa/incsearch.vim'
Plug 'pekepeke/titanium-vim'
Plug 'pearofducks/ansible-vim'
Plug 'majutsushi/tagbar'
Plug 'mxw/vim-jsx'
Plug 'airblade/vim-gitgutter'
Plug 'jamessan/vim-gnupg'
Plug 'mvrilo/github-status-vim', { 'on': 'GithubStatus' }
Plug 'w0rp/ale'
Plug 'Shougo/denite.nvim'
Plug 'toyamarinyon/vim-swift'
Plug 'elixir-lang/vim-elixir'
Plug 'mattn/sonictemplate-vim'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/gv.vim'
Plug 'leafgarland/typescript-vim'
Plug 'burnettk/vim-angular'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'rakr/vim-one'
call plug#end()

let g:ale_linters = {
\   'javascript': ['eslint'],
\}

if has('nvim')
  let g:deoplete#enable_at_startup = 1
endif
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
let g:indentLine_enabled = 1

colorscheme one

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

au BufRead,BufNewFile *.tss set ft=javascript " Titanium Alloy Style Files
au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4
au BufNewFile,BufReadPost *.md setl ts=4 sw=4 sts=4 expandtab
au BufNewFile,BufRead *.lua setlocal noet ts=4 sw=4 sts=4
au FileType dockerfile set noexpandtab
au FileType fstab,systemd set noexpandtab
au FileType gitconfig,sh,toml set noexpandtab

set wildmenu
set wildmode=list:longest
set wildmode=list:full

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

set t_ti= t_te=
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
set notimeout timeoutlen=1000 ttimeoutlen=0
set equalalways

match ErrorMsg '\%81v'
