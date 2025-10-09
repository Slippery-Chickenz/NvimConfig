local on_attach = function(_, bufnr)
	local attach_opts = { silent = true, buffer = bufnr }
	local keymap = vim.keymap
	keymap.set('n', 'gD', vim.lsp.buf.declaration, attach_opts)
	keymap.set('n', 'gd', vim.lsp.buf.definition, attach_opts)
	keymap.set('n', 'K', vim.lsp.buf.hover, attach_opts)
	keymap.set('n', 'gi', vim.lsp.buf.implementation, attach_opts)
	keymap.set('n', '<C-s>', vim.lsp.buf.signature_help, attach_opts)
	keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, attach_opts)
	keymap.set('n', '<leader>rn', vim.lsp.buf.rename, attach_opts)
	keymap.set('n', 'so', require("telescope.builtin").lsp_references, attach_opts)
end

return {
	cmd = { "cmake-language-server.exe" },
	filetypes = {
		"cmake",
		"CMakeLists.txt"
	},
	root_markers = { "CMakePresets.json", "CTestConfig.cmake", ".git", "build", "cmake" },
	on_attach = function(client)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
		on_attach(client)
	end,
}
