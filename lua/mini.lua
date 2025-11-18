
-- mini.bufremove
local bufremove = require('mini.bufremove')
bufremove.setup()
vim.keymap.set("n", "<leader>bd", function() bufremove.wipeout() end, { noremap = true, silent = true })

-- mini.surround
require('mini.surround').setup({
  custom_surroundings = {
    b = {
      input = { '%b()', '^.().*().$' },
      output = { left = '(', right = ')' }
    },
    B = {
      input = { '%b{}', '^.().*().$' },
      output = { left = '{', right = '}' }
    },
  },
  mappings = {
    add = 'ys',
    delete = 'ds',
    find = '',
    find_left = '',
    highlight = '',
    replace = 'cs',

    -- Add this only if you don't want to use extended mappings
    suffix_last = '',
    suffix_next = '',
  },
  search_method = 'cover',
})

-- mini.animate
require('mini.animate').setup({
  cursor = { enable = false },
  scroll = { enable = true },
  resize = { enable = false },
  open = { enable = false },
  close = { enable = false },
})

-- mini.files
local files = require('mini.files');
files.setup({
  mappings = {
    close       = '<leader>e',
    go_in       = '',
    go_in_plus  = 'l',
    go_out      = 'h',
    go_out_plus = '',
    mark_goto   = "'",
    mark_set    = 'm',
    reset       = '<BS>',
    reveal_cwd  = '@',
    show_help   = 'g?',
    synchronize = '=',
    trim_left   = '',
    trim_right  = '',
  },
  windows = { 
    preview = true,
    width_preview = 100,
  },
})
vim.keymap.set("n", "<leader>e", function() files.open() end, { noremap = true, silent = true })

require('mini.tabline').setup()
