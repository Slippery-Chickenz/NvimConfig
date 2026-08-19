-- Highlight hex code colors
vim.pack.add( { "https://github.com/brenoprata10/nvim-highlight-colors" } )

require('nvim-highlight-colors').setup({
	enable_short_hex = false,
	enable_hsl = false,
	enable_ansi = false,
	enable_xterm256 = false,
	enable_hsl_without_function = false,
	enable_named_colors = false,
})
