call plug#begin('~/.vim/plugs')
Plug 'tpope/vim-sensible'
Plug 'mattn/webapi-vim'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'mattn/emmet-vim'
Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdtree'
Plug 'SirVer/ultisnips'
Plug 'Shougo/neco-syntax'
Plug 'mattn/gist-vim', { 'on': 'Gist' }
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-dispatch'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'bronson/vim-trailing-whitespace', { 'on': 'FixWhitespace' }
Plug 'junegunn/vim-easy-align', { 'on': 'EasyAlign' }
Plug 'junegunn/gv.vim'
Plug 'andymass/vim-matchup'
Plug 'haya14busa/incsearch.vim'
Plug 'airblade/vim-gitgutter'
Plug 'w0rp/ale'
Plug 'itchyny/lightline.vim'
Plug 'sbdchd/neoformat'
Plug 'prettier/prettier'
Plug 'rhysd/git-messenger.vim'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-rhubarb'
Plug 'w0ng/vim-hybrid'
Plug 'mvrilo/vim-caplet'
Plug 'fatih/vim-go', {'do': 'GoInstallBinaries'}
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
Plug 'othree/yajs'
Plug 'peitalin/vim-jsx-typescript'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh \| UpdateRemotePlugins'}
call plug#end()

colorscheme hybrid

command! Pwd :echo expand('%:p')
command! Sudow :w! !sudo tee % >/dev/null

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'gitbranch', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ] ],
      \ },
      \ 'component': {
      \   'charvaluehex': '0x%B'
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

let mapleader = ','

let g:go_version_warning = 0
let g:go_fmt_command = 'goimports'
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
let g:indentLine_enabled = 1
let g:jsx_ext_required = 0

let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('smart_case', v:true)

if has('mac')
  let g:gist_open_browser_after_post = 1
  let g:gist_clip_command = 'pbcopy'
endif
let g:gist_post_private = 1
let g:gist_show_privates = 1
let g:gist_detect_filetype = 1

au BufNewFile,BufReadPost *.csv set nowrap
au BufNewFile,BufReadPost *.md,*.sql setl expandtab ts=4 sw=4 sts=4
au BufNewFile,BufRead *.lua,*.go setl noexpandtab ts=4 sw=4 sts=4
au FileType dockerfile,fstab,systemd,gitconfig,bash,sh,toml setl noexpandtab

map <space> /
nmap <C-p>      :FZF<CR>
nmap <C-n>      :tabn<CR>
nmap <C-m>      :tabp<CR>
nmap <C-t>      :tabnew<CR>
map  <leader>q  :q<cr>
map  <leader>w  :w<cr>
map  <leader>wq :wq<cr>
nmap <silent> <leader>ev :e $MYVIMRC<cr>
nmap <silent> <leader>tv :tabnew $MYVIMRC<cr>
nmap <silent> <leader>rv :source $MYVIMRC<cr>:echo "~/.vimrc reloaded!"<cr>
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

set encoding=UTF-8
set t_ti= t_te=
set pastetoggle=<leader>z
set wildmenu
set wildmode=list:longest
set tabstop=2
set shiftwidth=2
set softtabstop=2
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
set noshowmode

match ErrorMsg '\%81v'
