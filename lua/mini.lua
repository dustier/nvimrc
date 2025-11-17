
local bufremove = require('mini.bufremove')
bufremove.setup()
vim.keymap.set("n", "<leader>bd", function() bufremove.wipeout() end, { noremap = true, silent = true })
