

"=============================================================
"                      Basic Settings
"=============================================================
let mapleader = " "

set pumheight=10
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smartindent
set noshowcmd
set mouse=
set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1

set relativenumber
set number
set signcolumn=yes:1

set noerrorbells
set noshowmode
set nowrap

set hidden
set noswapfile
set nobackup
set nowritebackup
set ignorecase
set smartcase
set autowrite

set scrolloff=8
set incsearch
set nohls
set updatetime=50

" 打开文件时回到上一次编辑的位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"=============================================================
"                      Basic Keybindings
"=============================================================

" jk to normal mode
inoremap jk <esc>
inoremap <esc> <nop>
" tnoremap <esc> <c-\><c-n>
" tnoremap <c-l> <nop>

nnoremap H ^
nnoremap L $
onoremap H ^
onoremap L $
vnoremap H ^
vnoremap L $

nnoremap $ <nop>
nnoremap ^ <nop>
onoremap $ <nop>
onoremap ^ <nop>
vnoremap $ <nop>
vnoremap ^ <nop>

" <C-a> select entire contents of the current file
noremap <C-a> ggVG

" switch between windows
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

" jump in quickfix list
map <silent><C-j> :cnext<CR>
map <silent><C-k> :cprevious<CR>
nnoremap <silent><esc> :cclose<CR>

" close window
nnoremap <silent><leader>wc <cmd>close<CR>

" resize window
nnoremap <silent><leader>= <cmd>vertical resize +5<CR>
nnoremap <silent><leader>- <cmd>vertical resize -5<CR>

" switch to the next/previous buffer
nnoremap <silent><TAB> :bnext<CR>
nnoremap <silent><S-TAB> :bprevious<CR>

" reload the vimrc
nnoremap <leader>rr <cmd>so ~/.config/nvim/init.vim<CR>

" system clipboard
vnoremap <leader>y "+y
nnoremap <leader>Y "+yy
nnoremap <leader>y "+y

nnoremap <leader>p "+p
nnoremap <leader>P "+P

"=============================================================
"                      Plugin List
"=============================================================
call plug#begin('~/.vim/plugged')
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-vsnip'

Plug 'hrsh7th/vim-vsnip'
Plug 'dustier/friendly-snippets'
Plug 'lewis6991/gitsigns.nvim'

Plug 'folke/trouble.nvim'
Plug 'ray-x/lsp_signature.nvim'

Plug 'akinsho/bufferline.nvim'
Plug 'rbgrouleff/bclose.vim'

Plug 'ggandor/leap.nvim'

Plug 'MattesGroeger/vim-bookmarks'
Plug 'sbdchd/neoformat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'gcmt/wildfire.vim'
Plug 'psliwka/vim-smoothie'
Plug 'windwp/nvim-autopairs'
Plug 'nvim-lua/plenary.nvim'
Plug 'folke/todo-comments.nvim'

Plug 'liuchengxu/vista.vim'

Plug 'voldikss/vim-floaterm'
Plug 'akinsho/toggleterm.nvim'
Plug 'lambdalisue/suda.vim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

Plug 'ibhagwan/fzf-lua'

Plug 'szw/vim-maximizer'
Plug 'Vimjas/vim-python-pep8-indent'

Plug 'kyazdani42/nvim-tree.lua'

Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'dstein64/vim-startuptime'

Plug 'andymass/vim-matchup'
Plug 'danymat/neogen'
Plug 'fnune/base16-vim'

call plug#end()

" colorscheme
set termguicolors
set background=dark
colorscheme base16-classic-dark

highlight Comment ctermfg=green
" colorscheme peachpuff


"=============================================================
"                      Plugin KeyBinding
"=============================================================

" trouble
nnoremap <leader>t <cmd>TroubleToggle workspace_diagnostics<CR>
nnoremap <leader>u <cmd>TroubleToggle document_diagnostics<CR>

" nvim-tree
nnoremap <leader>e <cmd>NvimTreeToggle<CR>

" Neoformat
nnoremap <leader>ft :Neoformat<CR>

" === vim maximizer
nnoremap <leader>m :MaximizerToggle!<CR>

" fzf-lua 
nnoremap <leader>ff <cmd>lua require('fzf-lua').files()<CR>
nnoremap <leader>fg <cmd>lua require('fzf-lua').git_files()<CR>
nnoremap <leader>fb <cmd>lua require('fzf-lua').buffers()<CR>
nnoremap <leader>fl <cmd>lua require('fzf-lua').lines()<CR>
nnoremap <leader>bl <cmd>lua require('fzf-lua').blines()<CR>

nnoremap <leader>gp <cmd>lua require('fzf-lua').grep()<CR>
nnoremap <leader>gl <cmd>lua require('fzf-lua').live_grep_native()<CR>

nnoremap <leader>fr <cmd>lua require('fzf-lua').resume()<CR>

" vim-floaterm
nnoremap <silent> <leader>gg :FloatermNew --wintype=float --height=1.0 --width=1.0 --autoclose=2 lazygit<CR>

" bufferline.nvim
nnoremap <silent> gb <cmd>BufferLinePick<CR>

" Vista
" let g:vista_default_executive = 'ctags'
let g:vista_cursor_delay = 0
let g:vista_echo_cursor_strategy = 'floating_win'
let g:vista_disable_statusline = 0
let g:vista_highlight_whole_line = 0
let g:vista_floating_border = 'single'
let g:vista_floating_delay = 0
let g:vista_icon_indent = ["> ", ""]
nnoremap <silent> <leader>s <cmd>Vista!!<CR>

" todo-comments
nnoremap <silent> <leader>v <cmd>TroubleToggle todo<CR>

"=============================================================
"                      Plugin Settings
"=============================================================

" Neoformat
" Enable alignment
let g:neoformat_basic_format_align = 1
" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1
" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

" vim commentary
autocmd filetype cpp setlocal commentstring=//\ %s

" vim-floaterm
let g:floaterm_autoclose=2
let g:floaterm_keymap_new = '<M-[>'
let g:floaterm_keymap_toggle = '<M-]>'
let g:floaterm_wintype='vsplit'

" wildfire
let g:wildfire_objects = ["i'",'i"', "i)", "i]", "i}", "if","it", "a'", 'a"', "a)", "a]", "a}", "af","at"]

" vim-bookmarks
highlight BookmarkSign ctermbg=NONE ctermfg=160
highlight BookmarkLine ctermbg=194 ctermfg=NONE
let g:bookmark_sign=''
let g:bookmark_annotation_sign=''

" nvim-cmp
" Avoid showing message extra message when using completion
set shortmess+=c

lua <<EOF
require'bufferline'.setup{
    options = {
        offsets = {{filetype = "NvimTree", text = "File Explorer", text_align = "center"}},
    }
}

require('todo-comments').setup{
    signs = false,
    highlight = {
        keyword = "fg",
        after = ""
    }
}

require('trouble').setup{}
require('nvim-autopairs').setup{}
require('gitsigns').setup{
  current_line_blame_opts = {
    delay=0
  }
}


-- in local lua folder
require('tree')
require('treesitter')
require('lsp')
require('line')
require('gen')
require('terminal')
require('leap_')
-- require('autopair')

EOF
