vim.g.mapleader = ","

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Disable arrow keys
-- map('', '<up>', '<nop>')
-- map('', '<down>', '<nop>')
-- map('', '<left>', '<nop>')
-- map('', '<right>', '<nop>')

-- Clear search highlighting with <leader> and c
map('n', '<leader>c', ':nohl<CR>')

-- Move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- Terminal mappings
map('n', '<C-t>', ':FloatermNew<CR>', { noremap = true })
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

-- Telescope mappings
map("n", "<C-p>", ":Telescope find_files<CR>")
map("n", "<C-g>", ":Telescope live_grep<CR>")
map("n", "<leader>lg", ":Telescope live_grep<CR>")
map("n", "<leader>of", ":Telescope oldfiles<CR>")
map("n", "<leader>lg", ":Telescope live_grep<CR>")
map("n", "<leader>fb", ":Telescope buffers<CR>")
map("n", "<leader>fh", ":Telescope help_tags<CR>")
map("n", "<leader>ft", ":Telescope treesitter<CR>")
map("n", "<leader>fc", ":Telescope commands<CR>")
map("n", "<leader>fr", ":Telescope resume<CR>")
map("n", "<leader>fq", ":Telescope quickfix<CR>")
map("n", "<leader>/", ":Telescope current_buffer_fuzzy_find<CR>")

-- Visual move
map('v', '<', '<gv')
map('v', '>', '>gv')
