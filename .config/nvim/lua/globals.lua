P = function(v)
  print(vim.inspect(v))
  return v
end

vim.g.gitgutter_eager = 0
vim.g.gitgutter_realtime = 0
vim.g.go_fmt_command = 'goimports'
vim.g.go_version_warning = 0
vim.g.jsx_ext_required = 0
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = ","
vim.g.rustfmt_autosave = 1
vim.g.t_Co = 256
vim.api.nvim_set_option('updatetime', 300)

vim.cmd([[
  set background=dark
  set termguicolors
  set signcolumn=yes

  autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])
