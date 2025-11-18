
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
local animate = require('mini.animate');
animate.setup({
  cursor = { enable = false },
  scroll = {
    enable = true,
    -- Animate for 200 milliseconds with linear easing
    timing = animate.gen_timing.linear({ duration = 70, unit = 'total' }),

    -- Animate equally but with at most 120 steps instead of default 60
    -- subscroll = animate.gen_subscroll.equal({ max_output_steps = 60 }),
  },
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

-- mini.tabline
require('mini.tabline').setup()

-- mini.jump2d
require('mini.jump2d').setup()
vim.keymap.set('n', 's', '<Cmd>lua MiniJump2d.start(MiniJump2d.builtin_opts.query)<CR>')

-- mini.pairs
require('mini.pairs').setup()

-- mini.hipatterns
local hipatterns = require('mini.hipatterns')
hipatterns.setup({
  highlighters = {
    -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
    fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
    hack  = { pattern = '%f[%w]()HACK()%f[%W]',  group = 'MiniHipatternsHack'  },
    todo  = { pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo'  },
    note  = { pattern = '%f[%w]()NOTE()%f[%W]',  group = 'MiniHipatternsNote'  },
  },
  -- Delays (in ms) defining asynchronous highlighting process
  delay = {
    -- How much to wait for update after every text change
    text_change = 0,

    -- How much to wait for update after window scroll
    scroll = 50,
  },
})
