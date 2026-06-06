vim.keymap.set("n", "<leader>t", "<cmd>Trouble diagnostics toggle focus=true filter.buf=0<CR>")
vim.keymap.set("n", "<leader>v", "<cmd>Trouble symbols toggle<CR>")

require("trouble").setup()
