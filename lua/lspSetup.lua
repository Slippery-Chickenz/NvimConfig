local lspconfig = require("lspconfig")

-- List of servers to configure
lspconfig.servers = {
	"clangd",
	"cmake",
	"lua_ls",
	"pyright",
	"fortls",
	"bashls",
	"jsonls",
}

-- List of servers that use the default settings (others will be manually set up
local defaultServers = {
	"cmake",
	"pyright",
	"fortls",
	"bashls",
	"jsonls",
}

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = lspconfig.servers,
	automatic_installation = false,
})


-- Set on attach function
local on_attach = function(_, bufnr)
	local attach_opts = { silent = true, buffer = bufnr }
	local keymap = vim.keymap
	keymap.set('n', 'gD', vim.lsp.buf.declaration, attach_opts)
	keymap.set('n', 'gd', vim.lsp.buf.definition, attach_opts)
	keymap.set('n', 'K', vim.lsp.buf.hover, attach_opts)
	keymap.set('n', 'gi', vim.lsp.buf.implementation, attach_opts)
	keymap.set('n', '<C-s>', vim.lsp.buf.signature_help, attach_opts)
	keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, attach_opts)
	keymap.set('n', '<leader>rn', vim.lsp.buf.rename, attach_opts)
	keymap.set('n', 'so', require("telescope.builtin").lsp_references, attach_opts)
end

local on_init = function(client, _)
	if client.supports_method("textDocument/semanticTokens") then
		client.server_capabilities.semanticTokensProvider = nil
	end
end

-- Set Lsp capabilities (wait for cmp)
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem = {
	documentationFormat = { "markdown", "plaintext" },
	snippetSupport = true,
	preselectSupport = true,
	insertReplaceSupport = true,
	labelDetailsSupport = true,
	deprecatedSupport = true,
	commitCharactersSupport = true,
	tagSupport = { valueSet = { 1 } },
	resolveSupport = {
		properties = {
			"documentation",
			"detail",
			"additionalTextEdits",
		},
	},
}

-- Enable the language servers
for _, lsp in ipairs(defaultServers) do
	lspconfig[lsp].setup({
	on_attach = on_attach,
	capabilities = capabilities,
	on_init = on_init,
	})
end

lspconfig.clangd.setup({
	on_attach = function(client)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
		on_attach(client)
	end,
	capabilities = capabilities,
	on_init = on_init,
})

lspconfig.lua_ls.setup({
	capabilities = capabilities,
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if path ~= vim.fn.stdpath('config') and (vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc')) then
        return
      end
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT'
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
          -- Depending on the usage, you might want to add additional paths here.
           "${3rd}/luv/library"
			-- "${3rd}/busted/library",
        }
      }
    })
  end,
  settings = {
    Lua = {}
  }
})

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250
-- vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

local group = vim.api.nvim_create_augroup('OoO', {})

local function au(typ, pattern, cmdOrFn)
	if type(cmdOrFn) == 'function' then
		vim.api.nvim_create_autocmd(typ, { pattern = pattern, callback = cmdOrFn, group = group })
	else
		vim.api.nvim_create_autocmd(typ, { pattern = pattern, command = cmdOrFn, group = group })
	end
end

au({ 'CursorHold', 'InsertLeave' }, nil, function()
	local opts = {
		focusable = false,
		scope = 'cursor',
		close_events = { 'BufLeave', 'CursorMoved', 'InsertEnter' },
	}
	vim.diagnostic.open_float(nil, opts)
end)

au('InsertEnter', nil, function()
	vim.diagnostic.enable(false)
end)

au('InsertLeave', nil, function()
	vim.diagnostic.enable(true)
end)
