local nvim_lsp = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local lservers = { "gopls", "rust_analyzer", "tsserver", "bashls", "dockerls", "tflint" }
local installer = require("nvim-lsp-installer")
local coq = require("coq")

for _, lsp in ipairs(lservers) do
	nvim_lsp[lsp].setup(coq.lsp_ensure_capabilities({
		on_attach = on_attach,
		capabilities = capabilities,
	}))
end

installer.setup({ automatic_installation = true })

vim.diagnostic.config({ virtual_text = false })

-- local rt = {
--     server = {
--         settings = {
--             on_attach = function(_, bufnr)
--                 -- Hover actions
--                 vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
--                 -- Code action groups
--                 vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
--                 require 'illuminate'.on_attach(client)
--             end,
--             ["rust-analyzer"] = {
--                 checkOnSave = {
--                     command = "clippy"
--                 },
--             },
--         }
--     },
-- }
-- require('rust-tools').setup(rt)
