-- Neorg for notes
vim.pack.add({
	"https://github.com/nvim-neotest/nvim-nio",
	"https://github.com/pysan3/pathlib.nvim",
	"https://github.com/nvim-neorg/lua-utils.nvim",
	"https://github.com/nvim-neorg/neorg",
})
require("neorg").setup({
	load = {
		["core.defaults"] = {},
		["core.concealer"] = {
			config = {
				icon_preset = "diamond",
			},
		},
		["core.dirman"] = {
			config = {
				workspaces = {
					notes = "~/home/notes",
				},
				default_workspaces = "notes",
			},
		},
		["core.itero"] = {},
		["core.promo"] = {},
		["core.summary"] = {},
		["core.integrations.treesitter"] = {},
		["core.qol.toc"] = {
			config = {
				close_after_use = true,
			},
		},
	}
})
