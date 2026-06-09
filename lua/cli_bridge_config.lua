require("cli-bridge").setup()

vim.keymap.set({ "n", "v" }, "<C-l>", "<cmd>CliSend<CR>", { silent = true, desc = "Send prompt to CLI" })
vim.keymap.set("n", "<leader>cs", "<cmd>CliSelect<CR>", { silent = true, desc = "Select CLI instance" })
