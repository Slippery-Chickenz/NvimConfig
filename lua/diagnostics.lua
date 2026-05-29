vim.api.nvim_create_autocmd({ "CursorHold", "InsertLeave", "CursorMoved" } , { pattern = nil, callback = function()
	local bufnm, _ = vim.diagnostic.open_float(nil, {
			focusable = false,
			scope = "cursor",
			close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost", },
			--border = "single"
		}
	)
	if bufnm ~= nil then
		vim.diagnostic.config({ virtual_text = false, virtual_lines = false, })
	else
		vim.diagnostic.config({ virtual_text = true, virtual_lines = false, })
	end
end
})

vim.api.nvim_create_autocmd("InsertEnter", {pattern = nil, callback = function()
	vim.diagnostic.enable(false)
end
})

vim.api.nvim_create_autocmd("InsertLeave", {pattern = nil, callback = function()
	vim.diagnostic.enable(true)
end
})
