return {
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = {
		open_mapping = [[<leader>t]],
		shade_terminals = true,
		shading_factor = 50,
		persist_mode = true,
		direction = "float",
		insert_mappings = false,
		terminal_mappings = false,
		float_opts = {
			border = "curved",
			row = 4,
			columns =  20,
			width = 150,
			height = 42,
			title_pos = "left",
		},
	},
}
