
vim.keymap.set("n", " ", "<Nop>", { desc = "Ignore space", silent = true })

-- Remap up and down to go by visual line instead of file line
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("v", "j", "gj")
vim.keymap.set("v", "k", "gk")

-- Remap to find files or specific phrases in any file
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>fl", "<cmd>Telescope current_buffer_fuzzy_find<cr>")
vim.keymap.set("n", "<leader>fd", "<cmd>lua require('telescope.builtin').lsp_document_symbols( { symbols={'function', 'method'} } )<cr>")

-- Remap to set file tree as focus
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeFocus<cr>")

-- Remap to use Esc to go to normal mode in the terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-N>")

-- Remap to move between the open buffers
vim.keymap.set("n", "<leader>n", "<cmd>cnext<cr>")
vim.keymap.set("n", "<leader>p", "<cmd>cprev<cr>")
vim.keymap.set("n", "<leader>q", "<cmd>b#<cr>")

-- Remaps to surround selected text with certain characters
vim.keymap.set("v", "<leader>s(", "xi()<Esc>P")
vim.keymap.set("v", "<leader>s)", "xi()<Esc>P")

-- Remaps to go to certain error diagnostics
vim.keymap.set("n", "<leader>n", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>N", vim.diagnostic.goto_prev)

-- Move paragraphs with alt j/k
vim.keymap.set("n", "<A-j>", "}")
vim.keymap.set("n", "<A-k>", "{")

-- Func to automatically indent the correct amount when entering insert mode
vim.cmd[[function! IndentWithI()
    if len(getline('.')) == 0
        return "\"_cc"
    else
        return "i"
    endif
endfunction
nnoremap <expr> i IndentWithI()]]

--[[

-- Remaps to use harpoon
local harpoon = require("harpoon")

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>r", function() harpoon:list():remove() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)
]]
