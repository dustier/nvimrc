vim.g.mapleader = " "

require("options")
require("keymaps")
require("plugins")

vim.cmd.colorscheme("catppuccin")

require("trouble_config")
require("fzf_config")
require("gitsigns_config")
require("bookmarks_config")
require("cli_bridge_config")

require("mini")
require("treesitter")
require("lsp")
require("line")
