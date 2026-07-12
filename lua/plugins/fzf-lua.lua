-- Fzf lua to search for files
vim.pack.add( { "https://github.com/ibhagwan/fzf-lua" } )

require("fzf-lua").setup({
	"fzf-native",
	files = {
	},
})

vim.keymap.set("n", "<leader>ff", "<cmd>FzfLua files<cr>")
vim.keymap.set("n", "<leader>fg", "<cmd>FzfLua live_grep_native<cr>")
vim.keymap.set("n", "<leader>fr", "<cmd>FzfLua buffers<cr>")
