local options = {
  background = "dark",
  clipboard = 'unnamedplus',
  compatible = false,
  completeopt = 'menuone,noinsert,noselect',
  cursorline = false,
  encoding = "UTF-8",
  equalalways = true,
  expandtab = true,
  timeout = true,
  timeoutlen = 3000,
  ttimeoutlen = 100,
  hidden = true,
  history = 1000,
  ignorecase = true,
  inccommand = "split",
  lazyredraw = true,
  linebreak = true,
  mouse = "a",
  number = true,
  numberwidth = 4,
  shiftwidth = 2,
  showmode = false,
  smartcase = true,
  smartindent = true,
  softtabstop = 2,
  swapfile = false,
  synmaxcol = 240,
  tabstop = 2,
  termguicolors = true,
  updatetime = 200,
  wildmenu = true,
  wildmode = "list:longest",
  wrap = true,
}

vim.opt.shortmess:append("c")

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- -- Disable builtin plugins
local disabled_built_ins = {
   "2html_plugin",
   "getscript",
   "getscriptPlugin",
   "gzip",
   "logipat",
   "netrw",
   "netrwPlugin",
   "netrwSettings",
   "netrwFileHandlers",
   "matchit",
   "tar",
   "tarPlugin",
   "rrhelper",
   "spellfile_plugin",
   "vimball",
   "vimballPlugin",
   "zip",
   "zipPlugin",
   "tutor",
   "rplugin",
   "synmenu",
   "optwin",
   "compiler",
   "bugreport",
   "ftplugin",
}

for _, plugin in pairs(disabled_built_ins) do
   vim.g["loaded_" .. plugin] = 1
end
