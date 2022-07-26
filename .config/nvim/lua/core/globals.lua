P = function(v)
  print(vim.inspect(v))
  return v
end

vim.g.go_version_warning = 0
vim.g.go_fmt_command = 'goimports'
vim.g.gitgutter_realtime = 0
vim.g.gitgutter_eager = 0
vim.g.jsx_ext_required = 0
vim.g.rustfmt_autosave = 1
vim.g.t_Co = 256
vim.g.colorscheme = "onedark"

vim.cmd([[
  set background=dark
  set termguicolors
  try
    colorscheme onedark
  catch
  endtry
]])
