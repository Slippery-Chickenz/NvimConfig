-- Settings for default nvim
require("settings")

-- Remaps for base nvim
-- Remaps for specific plugins will be found within their specific folder
require("remaps")

-- Load color scheme
require("plugins/onedarkpro")

-- Load custom colors mostly for markdown files
require("customcolors")

-- Load Nerdfont icons
require("plugins/nvim-web-devicons")

-- Enable lsps
require("enable_lsp")

-- Setup blink for auto completion
require("plugins/blink")

-- Setup showing diagnostics in floating windows
require("diagnostics")

-- Install oil for file browsing
require("plugins/oil")

-- Install treesitter and parsers
require("plugins/treesitter")

-- Lualine for status bar
require("plugins/lualine")

-- fzf-lua to search for files
require("plugins/fzf-lua")
