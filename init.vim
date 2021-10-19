

"=============================================================
"                      Basic Settings
"=============================================================
let mapleader = " "

set pumheight=10
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=-1
set smartindent
set noshowcmd

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

" switch between windows
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

" jump in quickfix list
map <silent><C-j> :cnext<CR>
map <silent><C-k> :cprevious<CR>
nnoremap <silent><C-c> :cclose<CR>

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
Plug 'onsails/lspkind-nvim'

Plug 'folke/trouble.nvim'
Plug 'ray-x/lsp_signature.nvim'

Plug 'akinsho/bufferline.nvim'
Plug 'rbgrouleff/bclose.vim'

Plug 'MattesGroeger/vim-bookmarks'
Plug 'sbdchd/neoformat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'gcmt/wildfire.vim'
Plug 'psliwka/vim-smoothie'
" Plug 'p00f/nvim-ts-rainbow'
Plug 'windwp/nvim-autopairs'
Plug 'nvim-lua/plenary.nvim'
Plug 'folke/todo-comments.nvim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }

Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
Plug 'simrat39/symbols-outline.nvim'

Plug 'voldikss/vim-floaterm'
Plug 'lambdalisue/suda.vim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'szw/vim-maximizer'
Plug 'tpope/vim-fugitive'
" Plug 'w0ng/vim-hybrid'

Plug 'sainnhe/gruvbox-material'
Plug 'kyazdani42/nvim-tree.lua'

Plug 'shadmansaleh/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'dstein64/vim-startuptime'

Plug 'andymass/vim-matchup'

call plug#end()

" colorscheme
set termguicolors
set background=dark
let g:gruvbox_material_background = 'hard'
colorscheme gruvbox-material


"=============================================================
"                      Plugin KeyBinding
"=============================================================

" trouble
nnoremap <leader>t <cmd>TroubleToggle<CR>

" nvim-tree
nnoremap <leader>e <cmd>NvimTreeToggle<CR>

" Neoformat
nnoremap <leader>ft :Neoformat<CR>

" === vim maximizer
nnoremap <leader>m :MaximizerToggle!<CR>

" === fzf search ===
nnoremap <leader>fg :GFiles<CR>
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>fb :Buffers<CR>
nnoremap <Leader>fl :Lines<CR>
nnoremap <Leader>rg :Rg<CR>
let g:fzf_preview_window = 'right:50%'

" vim-floaterm
nnoremap <silent> <leader>gg :FloatermNew --wintype=float --height=1.0 --width=1.0 --autoclose=2 lazygit<CR>

" bufferline.nvim
nnoremap <silent> gb <cmd>BufferLinePick<CR>

" symbols-outline
noremap <silent> <leader>s <cmd>SymbolsOutline<CR>

" vim-doge
nnoremap <silent> <leader>d <cmd>DogeGenerate<CR>

" todo-comments
nnoremap <silent> <leader>v <cmd>TodoTrouble<CR>

"=============================================================
"                      Plugin Settings
"=============================================================

" vim-go
let g:go_code_completion_enabled=0
let g:go_fmt_fail_silently=1

" fzf.vim
let $FZF_DEFAULT_OPTS = '--reverse'

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -nargs=* -bang Rg call RipgrepFzf(<q-args>, <bang>0)

command! -bang -nargs=* BLines
    \ call fzf#vim#grep(
    \   'rg --with-filename --column --line-number --no-heading --smart-case . '.fnameescape(expand('%:p')), 1,
    \   fzf#vim#with_preview({'options': '--query '.shellescape(<q-args>).' --with-nth=4.. --delimiter=":"'}, 'right:50%'))
nnoremap H <cmd>BLines<CR>
nnoremap L <cmd>Lines<CR>

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
vim.g.symbols_outline = {
    highlight_hovered_item=false,
    show_guides = false,
    auto_preview = false,
    show_symbol_details = false
}

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

-- in local lua folder
require('tree')
require('treesitter')
require('lsp')
require('line')
require('autopair')

EOF
