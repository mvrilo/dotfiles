local actions = require("telescope.actions")
local telescope = require("telescope")

telescope.setup({
	defaults = {
		mappings = {
			i = {
				["<esc>"] = actions.close,
			},
		},
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--hidden",
			"--glob=!.git",
		},
	},
})

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "<C-p>", ":Telescope find_files<CR>")
map("n", "<C-g>", ":Telescope live_grep<CR>")
map("n", "<leader>of", ":Telescope oldfiles<CR>")
map("n", "<leader>lg", ":Telescope live_grep<CR>")
map("n", "<leader>fb", ":Telescope buffers<CR>")
map("n", "<leader>fh", ":Telescope help_tags<CR>")
map("n", "<leader>ft", ":Telescope treesitter<CR>")
map("n", "<leader>fc", ":Telescope commands<CR>")
map("n", "<leader>fr", ":Telescope resume<CR>")
map("n", "<leader>fq", ":Telescope quickfix<CR>")
map("n", "<leader>/", ":Telescope current_buffer_fuzzy_find<CR>")
