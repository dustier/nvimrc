

-- 设置 leader 键为空格
vim.g.mapleader = " "

-- =============================================================
--                       Basic Options
-- =============================================================
-- 基本编辑设置
vim.opt.pumheight = 10
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true

-- 界面与显示
vim.opt.showcmd = false
vim.opt.mouse = ""  -- 禁用鼠标
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.signcolumn = "yes:1"

-- 行为与体验
vim.opt.errorbells = false
vim.opt.showmode = false
vim.opt.wrap = false

-- 缓冲区与文件
vim.opt.hidden = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

-- 搜索
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- 自动保存与性能
vim.opt.autowrite = true
vim.opt.scrolloff = 8
vim.opt.updatetime = 50

-- 文件编码
vim.opt.fileencodings = "ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1"

-- 打开文件时回到上一次编辑的位置
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 1 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- =============================================================
--                       Basic Keymaps
-- =============================================================
-- jk to normal mode
vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("i", "<Esc>", "<Nop>", { noremap = true, silent = true })

-- H 行首 L 行尾 
vim.keymap.set({ "n", "o", "v" }, "H", "^", { noremap = true })
vim.keymap.set({ "n", "o", "v" }, "L", "$", { noremap = true })
vim.keymap.set({ "n", "o", "v" }, "$", "<Nop>", { noremap = true })
vim.keymap.set({ "n", "o", "v" }, "^", "<Nop>", { noremap = true })

-- 切换窗口
vim.keymap.set("n", "<leader>h", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>j", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>k", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>l", "<C-w>l", { noremap = true, silent = true })
-- 在 quickfix 列表中跳转
vim.keymap.set("n", "<C-j>", ":cnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", ":cprevious<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Esc>", ":cclose<CR>", { noremap = true, silent = true })

-- 关闭当前窗口
vim.keymap.set("n", "<leader>wc", "<cmd>close<CR>", { noremap = true, silent = true })

-- 调整窗口宽度
vim.keymap.set("n", "<leader>=", "<cmd>vertical resize +5<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>-", "<cmd>vertical resize -5<CR>", { noremap = true, silent = true })

-- 切换 buffer
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { noremap = true, silent = true })

-- 重新加载配置文件
vim.keymap.set("n", "<leader>rr", "<cmd>source ~/.config/nvim/init.lua<CR>", { noremap = true, silent = true })

-- 系统剪贴板操作
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>p", '"+p', { noremap = true, silent = true })

-- =============================================================
--                       Plugins
-- =============================================================
vim.pack.add({
	{ src = "https://github.com/catppuccin/nvim" },
    { src = "https://github.com/nvim-mini/mini.nvim" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	-- { src = "https://github.com/akinsho/bufferline.nvim" },
	-- { src = "https://github.com/ggandor/leap.nvim" },
    { src = "https://github.com/gcmt/wildfire.vim" },
    -- { src = "https://github.com/windwp/nvim-autopairs" },
    { src = "https://github.com/psliwka/vim-smoothie" },
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/ibhagwan/fzf-lua" },
    -- { src = "https://github.com/kyazdani42/nvim-tree.lua" },
    { src = "https://github.com/nvim-lualine/lualine.nvim" },
    { src = "https://github.com/kyazdani42/nvim-web-devicons" },
    { src = "https://github.com/andymass/vim-matchup" },
    { src = "https://github.com/szw/vim-maximizer" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/folke/trouble.nvim" },
    { src = "https://github.com/MattesGroeger/vim-bookmarks" },
    { src = "https://github.com/sbdchd/neoformat" },
    { src = "https://github.com/hrsh7th/nvim-cmp" },
    { src = "https://github.com/hrsh7th/cmp-nvim-lsp" },
    { src = "https://github.com/hrsh7th/cmp-path" },
    { src = "https://github.com/hrsh7th/cmp-buffer" },
    { src = "https://github.com/ray-x/lsp_signature.nvim" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "master" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter-context" },
    { src = "https://github.com/folke/sidekick.nvim" },
})

vim.cmd.colorscheme "catppuccin"

-- =============================================================
--                       Plugin Keymaps
-- =============================================================
--  trouble
vim.keymap.set("n", "<leader>t", "<cmd>Trouble diagnostics toggle focus=true filter.buf=0<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>v", "<cmd>Trouble symbols toggle<CR>", { noremap = true, silent = false })

-- " nvim-tree
-- vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { noremap = true, silent = true })

-- vim maximizer
vim.keymap.set("n", "<leader>m", "<cmd>MaximizerToggle!<CR>", { noremap = true, silent = true })

local map = vim.keymap.set

-- Neoformat
vim.keymap.set("n", "<leader>ft", "<cmd>Neoformat<CR>", { noremap = true, silent = true })

-- fzf-lua
vim.keymap.set("n", "<leader>ff", function() require('fzf-lua').files() end, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>fg", function() require('fzf-lua').git_files() end, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>fb", function() require('fzf-lua').buffers() end, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>fl", function() require('fzf-lua').lines() end, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>bl", function() require('fzf-lua').blines() end, { noremap = true, silent = true })

vim.keymap.set("n", "<leader>gp", function() require('fzf-lua').grep() end, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gl", function() require('fzf-lua').live_grep_native() end, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>fr", function() require('fzf-lua').resume() end, { noremap = true, silent = true })

-- bufferline.nvim
-- vim.keymap.set("n", "gb", "<cmd>BufferLinePick<CR>", { noremap = true, silent = true })

-- "=============================================================
-- "                      Plugin Settings
-- "=============================================================

-- Neoformat 配置
vim.g.neoformat_basic_format_align = 1    -- 启用对齐
vim.g.neoformat_basic_format_retab = 1    -- 启用 Tab 转空格
vim.g.neoformat_basic_format_trim = 1     -- 启用删除行尾空白

-- vim-bookmarks
-- 设置高亮（highlight）
vim.api.nvim_set_hl(0, "BookmarkSign", { ctermbg = "NONE", ctermfg = 160 })
vim.api.nvim_set_hl(0, "BookmarkLine", { ctermbg = 194, ctermfg = "NONE" })

-- 设置全局变量（用于 bookmark.nvim 等插件）
vim.g.bookmark_sign = ""
vim.g.bookmark_annotation_sign = ""

-- nvim-cmp
-- Avoid showing message extra message when using completion
vim.opt.shortmess:append("c")

-- require'bufferline'.setup{
--     -- options = {
--     --     offsets = {{filetype = "NvimTree", text = "File Explorer", text_align = "center"}},
--     -- }
-- }

require("trouble").setup()
require("fzf-lua").register_ui_select()

-- require('nvim-autopairs').setup{}
require('gitsigns').setup{
  current_line_blame_opts = {
    delay=0
  }
}


-- in local lua folder
require('mini')
-- require('tree')
require('treesitter')
require('lsp')
require('line')
-- require('leap_')
require('code')

-- Plug 'Vimjas/vim-python-pep8-indent'

-- call plug#end()

