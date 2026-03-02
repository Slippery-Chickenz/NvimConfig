-- return {}
return {
	"olimorris/onedarkpro.nvim",
	priority = 1000,
	opts = {
		transparency = true,
		cursorline = true,
		colors = {
			dark = {
				bg = "#1e1e1e", -- "#222222",
				fg = "#BBBBBB",
			}
		},
		highlights = {
			["@markup.link.url"] = { fg = "#1fdec8" },
		},
	},
}
