-- Color Theme
vim.pack.add({
	"https://github.com/github-main-user/lytmode.nvim"
})

require("lytmode").setup({
	transparent = true,
	color_overrides = {
			lytBack = "#1e1e1e", -- "#222222",
			lytFront = "#BBBBBB",
	},
	-- group_overrides = {
	--
	-- 	@markup.link.url = { fg = "#1fdec8" },
	-- },
})
