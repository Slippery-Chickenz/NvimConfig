-- Treesitter to install parsers
vim.pack.add( { "https://github.com/nvim-treesitter/nvim-treesitter",  } )

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
						}
						--"latex",

-- Get already installed parsers to not double install
local alreadyInstalled = require("nvim-treesitter.config").get_installed()

-- Parsers to install that are in ensure installed but not already installed
local parsersToInstall = vim.iter(ensureInstalled)
	:filter(function(parser) return not vim.tbl_contains(alreadyInstalled, parser) end)
	:totable()

-- Install the required parsers
require("nvim-treesitter").install(parsersToInstall)

-- Auto-start highlights & indentation when enter files of a certain type
vim.api.nvim_create_autocmd("FileType", {
	desc = "User: enable treesitter highlighting",
	callback = function(ctx)
		-- highlights
		local hasStarted = pcall(vim.treesitter.start)

		-- indent
		local noIndent = {}
		if hasStarted and not vim.list_contains(noIndent, ctx.match) then
			vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
		end
	end,
})
