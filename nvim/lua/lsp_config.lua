-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "<space>m", vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	--vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	-- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
	-- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
	-- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
	-- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
	-- vim.keymap.set('n', '<space>wl', function()
	--   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	-- end, bufopts)
	-- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)

	-- vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
	-- vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
	-- vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local lsp_flags = {
	-- This is the default in Nvim 0.7+
	--debounce_text_changes = 150,
	debounce_text_changes = 0,
}

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig")["pyright"].setup({ capabilities = capabilities, on_attach = on_attach, flags = lsp_flags })

require("lspconfig")["tsserver"].setup({
	on_attach = function(client, bufr)
		if client.name == "tsserver" then
			client.resolved_capabilities.document_formatting = false
		end
		on_attach(client, bufr)
	end,
	flags = lsp_flags,
	capabilities = capabilities,
	filetypes = {
		"typescript",
		"javascript",
		"typescriptreact",
		"javascriptreact",
		"typescript.tsx",
		"javascript.jsx",
	},
	cmd = { "typescript-language-server", "--stdio" },
})
require("lspconfig")["rust_analyzer"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	flags = lsp_flags,
	-- Server-specific settings...
	settings = {
		["rust-analyzer"] = {},
	},
	cmd = { "rust-analyzer" },
})

require("lspconfig")["clangd"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "h", "c", "cpp", "cc", "objc", "objcpp" },
	flags = lsp_flags,
	cmd = { "clangd", "--background-index" },
	single_file_support = true,
})

require("lspconfig")["lua_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	--filetypes = { "h", "c", "cpp", "cc", "objc", "objcpp"},
})

require("lspconfig")["bashls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

require("lspconfig").sqlls.setup({
	capabilities = capabilities,
	on_attach = function(client, bufr)
		client.resolved_capabilities.document_formatting = false
		on_attach(client, bufr)
	end,
})
