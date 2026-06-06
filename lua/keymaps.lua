vim.keymap.set("i", "jk", "<Esc>", { silent = true })
vim.keymap.set("i", "<Esc>", "<Nop>", { silent = true })

vim.keymap.set({ "n", "o", "v" }, "H", "^")
vim.keymap.set({ "n", "o", "v" }, "L", "$")
vim.keymap.set({ "n", "o", "v" }, "$", "<Nop>")
vim.keymap.set({ "n", "o", "v" }, "^", "<Nop>")

vim.keymap.set("n", "<leader>h", "<C-w>h", { silent = true })
vim.keymap.set("n", "<leader>j", "<C-w>j", { silent = true })
vim.keymap.set("n", "<leader>k", "<C-w>k", { silent = true })
vim.keymap.set("n", "<leader>l", "<C-w>l", { silent = true })

vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>", { silent = true })
vim.keymap.set("n", "<C-k>", "<cmd>cprevious<CR>", { silent = true })
vim.keymap.set("n", "<Esc>", "<cmd>cclose<CR>", { silent = true })

vim.keymap.set("n", "<leader>wc", "<cmd>close<CR>", { silent = true })

vim.keymap.set("n", "<leader>=", "<cmd>vertical resize +5<CR>", { silent = true })
vim.keymap.set("n", "<leader>-", "<cmd>vertical resize -5<CR>", { silent = true })

vim.keymap.set("n", "<Tab>", "<cmd>bnext<CR>", { silent = true })
vim.keymap.set("n", "<S-Tab>", "<cmd>bprevious<CR>", { silent = true })

vim.keymap.set("n", "<leader>rr", function()
  vim.cmd.source(vim.env.MYVIMRC)
end, { silent = true })

vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { silent = true })
vim.keymap.set("n", "<leader>p", '"+p', { silent = true })

vim.keymap.set("n", "<leader>m", "<cmd>MaximizerToggle!<CR>", { silent = true })
vim.keymap.set("n", "<leader>ft", function()
  vim.lsp.buf.format()
end, { silent = true })
