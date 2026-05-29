-- Oil file manager
vim.pack.add( { "https://github.com/stevearc/oil.nvim" } )
require("oil").setup({
	default_file_explorer = true,
	columns = { "icon", },
	use_default_kepmaps = true, -- press g? in oil buffer to list keymaps
	view_options = {
		show_hidden = true,
	},
	float = {
		padding = 2,
	},
})

-- Set keymap to open file explorer
vim.keymap.set("n", "<leader>e", function()
	require("oil").toggle_float(nil, { preview = { vertical = true } })
end
)
