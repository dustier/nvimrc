
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
