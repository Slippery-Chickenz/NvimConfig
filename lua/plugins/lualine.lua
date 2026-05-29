-- Lualine for status bar
vim.pack.add( { "https://github.com/nvim-lualine/lualine.nvim" } )
require("lualine").setup({
	options = {
		theme = "codedark",
		component_separators = { left = "|", right = "|" },
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_c = {
			{
				"filename",
				path = 1,
			},
		},
	},
})
