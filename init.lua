vim.g.mapleader = " "

require("options")
require("keymaps")
require("plugins")

vim.cmd.colorscheme("catppuccin")

require("plugin.trouble")
require("plugin.fzf")
require("plugin.gitsigns")
require("plugin.bookmarks")

require("mini")
require("treesitter")
require("lsp")
require("line")
