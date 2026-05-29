return {
	cmd = { "rust-analyzer" },
	filetypes = { "rust" },
	root_markers = { ".git" },
	settings = {
		Lua = {
			codeLens = {
				enable = true,
			},
			hint = {
				enable = true,
				semicolon = "Disable",
			},
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
}
