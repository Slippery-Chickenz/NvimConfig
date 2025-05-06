local o = vim.opt

o.number = true
o.relativenumber = true
o.syntax = "on"
o.autoindent = true
o.cursorline = true
o.shiftwidth = 4
o.tabstop = 4
o.ruler = true
o.title = true
o.showcmd = true
o.scrolloff = 100

vim.cmd("colorscheme onedark_vivid")

require("lspconfig").servers = {
	"clangd",
	"cmake",
	"lua_ls",
	"pyright",
	"fortls",
}
