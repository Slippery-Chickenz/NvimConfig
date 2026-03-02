return {
	"nvim-neorg/neorg",
	lazy = false,
	version = "*",
	config = function()
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
	end,
	opts = {
	},
}
