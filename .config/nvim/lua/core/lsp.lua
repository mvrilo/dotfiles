local nvim_lsp = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local lservers = { "gopls", "rust_analyzer", "tsserver", "bashls", "dockerls", "tflint" }
local installer = require("nvim-lsp-installer")

for _, lsp in ipairs(lservers) do
	nvim_lsp[lsp].setup {
		on_attach = on_attach,
		capabilities = capabilities,
	}
end

installer.setup({ automatic_installation = true })

vim.diagnostic.config({ virtual_text = false })
