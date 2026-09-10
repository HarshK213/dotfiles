---------------------------------
-- Formatting
---------------------------------
local diagnostics = require("null-ls").builtins.diagnostics
local formatting = require("null-ls").builtins.formatting
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

require("null-ls").setup({
	sources = {
		formatting.black,
		formatting.phpcsfixer,
		formatting.prettier,
		formatting.stylua,
	},
	on_attach = function(client, bufnr)
		if client.name == "ts_ls" or client.name == "rust_analyzer" or client.name == "pyright" then
			client.server_capabilities.document_formatting = false
		end

		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format()
				end,
			})
		end
	end,
})