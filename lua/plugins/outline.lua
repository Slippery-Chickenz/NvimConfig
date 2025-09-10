return {
	"hedyhli/outline.nvim",
	lazy = true,
	cmd = { "Outline", "OutlineOpen" },
	keys = { -- Example mapping to toggle outline
		{ "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
	},
	opts = {
		outline_window = {
			auto_close = true,
		},
		outline_items = {
			show_symbol_lineno = true
		},
		symbol_folding = {
			-- autofold_depth = 5
		}
	},
}
