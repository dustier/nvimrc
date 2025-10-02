-- Treesitter configuration
-- Parsers must be installed manually via :TSInstall
-- vim.cmd("packadd nvim-treesitter")
require('nvim-treesitter.configs').setup {
  matchup = {
    enable = true
  },
  highlight = {
    enable = true, -- false will disable the whole extension
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm',
    },
  },
  indent = {
    enable = true,
  },
}
require'treesitter-context'.setup{}

-- vim.opt.foldmethod = 'expr'
-- vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
