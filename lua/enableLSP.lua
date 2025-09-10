vim.lsp.enable("pyright")
vim.lsp.enable('luals')
vim.lsp.enable('clangd')

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
au({ 'CursorHold', 'InsertLeave', 'DiagnosticChanged', 'CursorMoved' }, nil, function()
	local opts = {
		focusable = false,
		scope = 'cursor',
		close_events = { 'BufLeave', 'CursorMoved', 'InsertEnter' },
		--border = 'single'
	}
	local bufnm, _ = vim.diagnostic.open_float(nil, opts)
	if bufnm ~= nil then
		vim.diagnostic.config({ virtual_text = false, virtual_lines = false, })
	else
		vim.diagnostic.config({ virtual_text = true, virtual_lines = false, })
	end
end)

au('InsertEnter', nil, function()
	vim.diagnostic.enable(false)
end)

au('InsertLeave', nil, function()
	vim.diagnostic.enable(true)
end)
-- , 'CursorMoved'
