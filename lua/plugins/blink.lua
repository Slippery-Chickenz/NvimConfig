-- Blink CMP
vim.pack.add( { "https://github.com/saghen/blink.lib", "https://github.com/saghen/blink.cmp" } )
local cmp = require("blink.cmp")
cmp.setup({
	keymap = { preset = "enter" },
	appearance = { nerd_font_variant = "mono" },
	signature = { enabled = true },
    completion = {
		documentation = { auto_show = true },
		ghost_text = { enabled = true},
		menu = {
			draw = {
				columns = {
					{ "label", "label_description", gap = 1},
					{ "kind_icon", "kind" },
				}
			}
		}
	},
    sources = {
		default = { 'lsp', 'path', 'snippets', 'buffer'}, --, 'vimtex' },
		-- providers = {
		-- 	vimtex = {
		-- 		name = 'vimtex',
		-- 		module = "blink.compat.source",
		-- 		score_offset = -3,
		-- 	},
		-- },
    },
})
cmp.build():wait(60000)
cmp.setup()
