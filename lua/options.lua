vim.opt.pumheight = 10
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true

vim.opt.showcmd = false
vim.opt.mouse = ""
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.signcolumn = "yes:1"

vim.opt.errorbells = false
vim.opt.showmode = false
vim.opt.wrap = false

vim.opt.hidden = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true

vim.opt.autowrite = true
vim.opt.scrolloff = 8
vim.opt.updatetime = 50

vim.opt.fileencodings = "ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1"
vim.opt.shortmess:append("c")

vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local line_count = vim.api.nvim_buf_line_count(0)

    if mark[1] > 1 and mark[1] <= line_count then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})
