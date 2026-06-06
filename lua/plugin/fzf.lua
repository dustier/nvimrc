vim.keymap.set("n", "<leader>ff", function()
  require("fzf-lua").files()
end, { silent = true })

vim.keymap.set("n", "<leader>fg", function()
  require("fzf-lua").git_files()
end, { silent = true })

vim.keymap.set("n", "<leader>fb", function()
  require("fzf-lua").buffers()
end, { silent = true })

vim.keymap.set("n", "<leader>fl", function()
  require("fzf-lua").lines()
end, { silent = true })

vim.keymap.set("n", "<leader>bl", function()
  require("fzf-lua").blines()
end, { silent = true })

vim.keymap.set("n", "<leader>gp", function()
  require("fzf-lua").grep()
end, { silent = true })

vim.keymap.set("n", "<leader>gl", function()
  require("fzf-lua").live_grep_native()
end, { silent = true })

vim.keymap.set("n", "<leader>fr", function()
  require("fzf-lua").resume()
end, { silent = true })

require("fzf-lua").register_ui_select()
