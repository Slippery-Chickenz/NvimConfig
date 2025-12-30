
local function set_python_path(path)
  local clients = vim.lsp.get_clients {
    bufnr = vim.api.nvim_get_current_buf(),
    name = 'pyright',
  }
  for _, client in ipairs(clients) do
    if client.settings then
      client.settings.python = vim.tbl_deep_extend('force', client.settings.python, { pythonPath = path })
    else
      client.config.settings = vim.tbl_deep_extend('force', client.config.settings, { python = { pythonPath = path } })
    end
    client.notify('workspace/didChangeConfiguration', { settings = nil })
  end
end

local on_attach = function(client, bufnr)
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

	vim.api.nvim_buf_create_user_command(bufnr, 'LspPyrightOrganizeImports', function()
      client:exec_cmd({
        command = 'pyright.organizeimports',
        arguments = { vim.uri_from_bufnr(bufnr) },
      })
    end, {
      desc = 'Organize Imports',
    })
    vim.api.nvim_buf_create_user_command(bufnr, 'LspPyrightSetPythonPath', set_python_path, {
      desc = 'Reconfigure pyright with the provided python path',
      nargs = 1,
      complete = 'file',
    })
end

return {
	cmd = { "pyright-langserver", "--stdio" },
	-- Filetypes to automatically attach to. 
	filetypes = { 'python' },
	-- Sets the "workspace" to the directory where any of these files is found.
	-- Files that share a root directory will reuse the LSP server connection.
	-- Nested lists indicate equal priority, see |vim.lsp.Config|.
	root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", "pyrightconfig.json", ".git" },
	on_attach = function(client, bufnr)
		on_attach(client, bufnr)
	end,
	settings =  {
		python = {
		analysis = {
		  --[[ diagnosticSeverityOverrides = {
					reportUnusedImport = "warning",
					reportUnusedFunction = "warning",
					reportUnusedVariable = "warning", }, ]]
		  autoSearchPaths = true,
		  diagnosticMode = "openFilesOnly",
		  useLibraryCodeForTypes = true
		}
	  }
	}
}
