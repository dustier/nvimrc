require('neogen').setup{
    enabled = true
}
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<Leader>nf", ":lua require('neogen').generate()<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-e>", ":lua require('neogen').jump_next()<CR>", { silent = true, noremap = true })

