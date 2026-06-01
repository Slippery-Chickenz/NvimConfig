-- Arborist to install parsers
vim.pack.add( { "https://github.com/arborist-ts/arborist.nvim",  } )

require("arborist").setup({
	overrides = {
		norg = { url = "https://github.com/nvim-neorg/tree-sitter-norg" },
		norg_meta = { url = "https://github.com/nvim-neorg/tree-sitter-norg-meta" },
	},
	ensure_installed = {
		"norg",
		"norg_meta",
	}
})

-- List of parsers to install
local ensureInstalled = {
						"c",
						"lua",
						"vim",
						"vimdoc",
						"cmake",
						"cpp",
						"python",
						"rust",
						"json",
						"norg",
						"norg-meta",
						}
						--"latex",
