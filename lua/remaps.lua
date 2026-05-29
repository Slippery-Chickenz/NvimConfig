
-- Ignore the space key because its the leader
vim.keymap.set("n", " ", "<Nop>", { desc = "Ignore space", silent = true })

-- Remap up and down to go by visual line instead of file line
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("v", "j", "gj")
vim.keymap.set("v", "k", "gk")

-- Commands to move around lsp diagnostics
local attach_opts = { silent = true }
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, attach_opts)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, attach_opts)
vim.keymap.set('n', 'K', vim.lsp.buf.hover, attach_opts)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, attach_opts)
vim.keymap.set('n', '<C-s>', vim.lsp.buf.signature_help, attach_opts)
vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, attach_opts)

-- Remap to use Esc to go to normal mode in the terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-N>")

-- Remap to move between to previous buffer
vim.keymap.set("n", "<leader>q", "<cmd>b#<cr>")

-- Remaps to surround selected text with certain characters
vim.keymap.set("v", "(", "c(<ESC>pa)")
vim.keymap.set("v", "'", "c'<ESC>pa'")
vim.keymap.set("v", '"', 'c"<ESC>pa"')
vim.keymap.set("v", '[', 'c[<ESC>pa]')
vim.keymap.set("v", '{', 'c{<ESC>pa}')

-- Remaps to go to certain error diagnostics
vim.keymap.set("n", "<leader>n", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>N", vim.diagnostic.goto_prev)

-- Move paragraphs with alt j/k
vim.keymap.set("n", "<A-j>", "}")
vim.keymap.set("n", "<A-k>", "{")

-- Still need to add neorg to config

-- Remaps for neorg commands
-- vim.keymap.set("n", "<leader>mn", function ()
-- 	vim.cmd([[ execute "normal \<Plug>(neorg.dirman.new-note)"]])
-- 	vim.cmd([[ execute "normal a"]])
-- 	vim.cmd("startinsert")
-- end)
--
-- vim.keymap.set("n", "<leader>go", "<cmd>Neorg toc<CR>")
-- vim.keymap.set("n", "<leader>d", "<Plug>(neorg.qol.todo-items.todo.task-done)")
-- vim.keymap.set("n", "<leader>u", "<Plug>(neorg.qol.todo-items.todo.task-undone)")
-- vim.keymap.set("i", "<C-o>", "<Plug>(neorg.itero.next-iteration)")
-- vim.keymap.set("n", "<leader>o", "i<Plug>(neorg.itero.next-iteration)")

-- Func to automatically indent the correct amount when entering insert mode
vim.cmd[[function! IndentWithI()
    if len(getline('.')) == 0
        return "\"_cc"
    else
        return "i"
    endif
endfunction
nnoremap <expr> i IndentWithI()]]
