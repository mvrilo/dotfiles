call plug#begin('~/.vim/plugs')
Plug 'tpope/vim-sensible'
Plug 'mattn/webapi-vim'

if has('nvim-0.5')
  Plug 'neovim/nvim-lspconfig'
  Plug 'tjdevries/lsp_extensions.nvim'
  Plug 'nvim-lua/completion-nvim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-lua/lsp-status.nvim'
  " Plug 'nvim-telescope/telescope.nvim'
  Plug 'hrsh7th/nvim-compe'
endif

if has('nvim')
  Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/denite.nvim'
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'w0rp/ale'
Plug 'mattn/gist-vim', { 'on': 'Gist' }
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'hashivim/vim-terraform'
Plug 'bronson/vim-trailing-whitespace', { 'on': 'FixWhitespace' }
Plug 'junegunn/vim-easy-align', { 'on': 'EasyAlign' }
Plug 'junegunn/gv.vim'
Plug 'andymass/vim-matchup'
Plug 'haya14busa/incsearch.vim'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'sbdchd/neoformat'
Plug 'deoplete-plugins/deoplete-lsp', { 'do': 'make' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'buoto/gotests-vim'
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'

Plug 'joshdick/onedark.vim'
call plug#end()

set termguicolors
colorscheme onedark

command! Pwd :echo expand('%:p')

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

let g:completion_enable_auto_popup = 1
let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 1
let g:ale_fix_on_save = 1
let g:ale_linters = {
  \ 'rust': ['rust_analyzer','cargo','rustfmt'],
  \ 'go': ['revive', 'gofmt', 'goimports'],
  \ 'typescriptreact': ['eslint'],
  \ 'typescript': ['eslint'],
  \ 'javascript': ['eslint'],
  \ 'tsx': ['eslint'],
  \ 'jsx': ['eslint'],
  \ }
let g:ale_fixers = {
  \ '*': ['remove_trailing_lines', 'trim_whitespace'],
  \ 'typescriptreact': ['eslint'],
  \ 'typescript': ['eslint'],
  \ 'javascript': ['eslint'],
  \ 'tsx': ['eslint'],
  \ 'jsx': ['eslint'],
  \ 'rust': ['rust_analyzer','cargo','rustfmt'],
  \ }

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
let g:jsx_ext_required = 0
let g:rustfmt_autosave = 1
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('smart_case', v:true)

if has('mac')
  let g:gist_open_browser_after_post = 1
  let g:gist_clip_command = 'pbcopy'
endif

let g:gist_post_private = 1
let g:gist_show_privates = 1
let g:gist_detect_filetype = 1

set completeopt=menuone,noinsert,noselect
set shortmess+=c

au BufNewFile,BufReadPost *.csv set nowrap
au BufNewFile,BufReadPost *.proto,*.md,*.sql setl expandtab ts=4 sw=4 sts=4
au BufNewFile,BufReadPost *.lua,*.go,*.php setl noexpandtab ts=4 sw=4 sts=4
au FileType dockerfile,fstab,systemd,gitconfig,bash,sh,toml setl noexpandtab

inoremap <expr> <tab>   pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

nmap <space> /
nmap <c-p> :FZF<CR>
nmap <c-b> :tabp<CR>
nmap <c-n> :tabn<CR>
nmap <c-t> :tabnew<CR>

map  <leader>q  :q<cr>
map  <leader>w  :w<cr>
map  <leader>wq :wq<cr>
nmap <silent> <leader>ev :e $MYVIMRC<cr>
nmap <silent> <leader>tv :tabnew $MYVIMRC<cr>
nmap <silent> <leader>rv :source $MYVIMRC<cr>:echo "~/.vimrc reloaded!"<cr>
vmap <leader>b :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>
map  <leader>lg :<C-U>!git lg <C-R>=expand("%:p")<CR><CR>

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

" Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

" Avoid showing extra messages when using completion
set shortmess+=c

set omnifunc=ale#completion#OmniFunc
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
set updatetime=200

match ErrorMsg '\%81v'

if has('nvim-0.5')
lua << EOF
  local nvim_lsp = require('lspconfig')

  local on_attach = function(client)
    require('lsp-status').on_attach(client)

    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings
    local opts = { noremap=true, silent=true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

    require('completion').on_attach()
  end

  nvim_lsp["gopls"].setup {
    on_attach = on_attach,
    gopls = {
      settings = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
        codelenses = {
          gc_details = true,
        }
      }
    },
  }

  local lservers = { "rust_analyzer", "tsserver", "bashls" }
  for _, lsp in ipairs(lservers) do
    nvim_lsp[lsp].setup { on_attach = on_attach }
  end
EOF
endif
