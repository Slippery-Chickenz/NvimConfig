-- Color Theme
vim.pack.add({
	"https://github.com/olimorris/onedarkpro.nvim"
})

require("onedarkpro").setup({
	options = {
		transparency = true,
		cursorline = true,
		lualine_transparency = true,
	},
	colors = {
		dark = {
			bg = "#1e1e1e", -- "#222222",
			fg = "#BBBBBB",
		}
	},
	highlights = {
		["@markup.link.url"] = { fg = "#1fdec8" },
	},
})

-- Set colorscheme
vim.cmd("colorscheme onedark")
