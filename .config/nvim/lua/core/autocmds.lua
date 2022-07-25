local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank
augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
  group = 'YankHighlight',
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = '1000' })
  end
})

-- Remove whitespace on save
autocmd('BufWritePre', {
  pattern = '*',
  command = ":%s/\\s\\+$//e"
})

-- Don't auto commenting new lines
autocmd('BufEnter', {
  pattern = '*',
  command = 'set fo-=c fo-=r fo-=o'
})

-- Disable line length marker
augroup('setLineLength', { clear = true })
autocmd('Filetype', {
  group = 'setLineLength',
  pattern = { 'text', 'markdown', 'html', 'xhtml' },
  command = 'setlocal cc=0'
})

-- Enter insert mode when switching to terminal
autocmd('TermOpen', {
  command = 'setlocal listchars= nonumber norelativenumber nocursorline',
})

autocmd('TermOpen', {
  pattern = '*',
  command = 'startinsert'
})

-- Close terminal buffer on process exit
autocmd('BufLeave', {
  pattern = 'term://*',
  command = 'stopinsert'
})

-- Close terminal buffer on process exit
autocmd('BufLeave', {
  pattern = '*.csv',
  command = 'set nowrap'
})

-- Close terminal buffer on process exit
autocmd('BufLeave', {
  pattern = '*.csv',
  command = 'set nowrap'
})

-- No wrap for specific filetypes
autocmd('BufNewFile,BufReadPost', {
  pattern = '*.proto,*.md,*.sql,*.yaml',
  command = 'set nowrap'
})

-- expand tab for specific filetypes
autocmd('BufNewFile,BufReadPost', {
  pattern = '*.lua,*.go,*.php,*.js,*.typescript,Dockerfile',
  command = 'set expandtab ts=4 sw=4 sts=4'
})

-- vim.filetype.add {
--   extension = {
--     png = 'image',
--     jpg = 'image',
--     jpeg = 'image',
--     tf = 'terraform',
--     tsx = 'typescriptreact',
--     ts = 'typescript',
--   },
--   filename = {
--     ['.eslintrc'] = 'json',
--     ['.prettierrc'] = 'json',
--     ['.babelrc'] = 'json',
--     ['.stylelintrc'] = 'json',
--   },
--   pattern = {
--     ['.env.*'] = 'sh',
--   },
-- }
