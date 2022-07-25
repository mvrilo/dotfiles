vim.g.mapleader = ","

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Disable arrow keys
map('', '<up>', '<nop>')
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')

-- Clear search highlighting with <leader> and c
map('n', '<leader>c', ':nohl<CR>')

-- Move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- Terminal mappings
map('n', '<C-t>', ':Term<CR>', { noremap = true })
map('t', '<Esc>', '<C-\\><C-n>')
map('n', '<C-N>', ':NvimTreeToggle<CR>')

-- Tabs mapping
map('n', '<C-b>', ':tabprev<CR>')
map('n', '<C-n>', ':tabnext<CR>')

-- Leader mappings
map('n', '<leader>r', ':so %<CR>')
map('n', '<leader>q', ':q<CR>')
map('n', '<leader>w', ':w<CR>')
map('n', '<leader>wq', ':wq<CR>')
map('n', '<leader>n', ':tabnew<CR>')

-- Visual move
map('v', '<', '<gv')
map('v', '>', '>gv')
