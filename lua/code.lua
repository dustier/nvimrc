require("sidekick").setup({
  jump = {
    jumplist = true, -- add an entry to the jumplist
  },
  signs = {
    enabled = true, -- enable signs by default
    icon = " ",
  },
  nes = {
    ---@type boolean|fun(buf:integer):boolean?
    -- enabled = function(buf)
    --   return vim.g.sidekick_nes ~= false and vim.b.sidekick_nes ~= false
    -- end,
    enabled = false,
    debounce = 100,
    trigger = {
      -- events that trigger sidekick next edit suggestions
      events = { "ModeChanged i:n", "TextChanged", "User SidekickNesDone" },
    },
    clear = {
      -- events that clear the current next edit suggestion
      events = { "TextChangedI", "InsertEnter" },
      esc = true, -- clear next edit suggestions when pressing <Esc>
    },
    ---@class sidekick.diff.Opts
    ---@field inline? "words"|"chars"|false Enable inline diffs
    diff = {
      inline = "words",
    },
  },
  -- Work with AI cli tools directly from within Neovim
  cli = {
    watch = true, -- notify Neovim of file changes done by AI CLI tools
    ---@class sidekick.win.Opts
    win = {
      --- The is ran when a new terminal is created, before starting it.
      --- Here you can change window options `terminal.opts`.
      ---@param terminal sidekick.cli.Terminal
      config = function(terminal) end,
      wo = {}, ---@type vim.wo
      bo = {}, ---@type vim.bo
      -- layout = "right", ---@type "float"|"left"|"bottom"|"top"|"right"
      layout = "right", ---@type "float"|"left"|"bottom"|"top"|"right"
      --- Options used when layout is "float"
      ---@type vim.api.keyset.win_config
      float = {
        width = 0.9,
        height = 0.9,
      },
      -- Options used when layout is "left"|"bottom"|"top"|"right"
      ---@type vim.api.keyset.win_config
      split = {
        width = 120,
        height = 20,
      },
      --- CLI Tool Keymaps
      --- default mode is `t`
      ---@type table<string, sidekick.cli.Keymap|false>
      keys = {
        buffers       = { "<c-i>", "buffers"   , mode = "nt", desc = "open buffer picker" },
        files         = { "<c-f>", "files"     , mode = {"n", "t"}, desc = "open file picker" },
        hide_t        = { "<c-l>", "hide"      , mode = {"n", "t"}, desc = "hide the terminal window" },
        prompt        = { "<c-p>", "prompt"      , mode = {"t"}, desc = "insert prompt or context" },
        stopinsert    = { "<esc>", "stopinsert", mode = "t" , desc = "enter normal mode" },
      },
    },
    ---@class sidekick.cli.Mux
    ---@field backend? "tmux"|"zellij" Multiplexer backend to persist CLI sessions
    mux = {
      backend = "tmux",
      enabled = true,
    },
    ---@type table<string, sidekick.cli.Tool.spec>
    tools = {
      copilot = { cmd = { "copilot", "--banner" }, url = "https://github.com/github/copilot-cli" },
    },
    ---@type table<string, sidekick.Prompt>
    prompts = {
      changes         = "Can you review my changes?",
      diagnostics     = "Can you help me fix the diagnostics in {file}?\n{diagnostics}",
      diagnostics_all = "Can you help me fix these diagnostics?\n{diagnostics_all}",
      document        = "Add documentation to {function|line}",
      explain         = "Explain {this}",
      fix             = "Can you fix {this}?",
      optimize        = "How can {this} be optimized?",
      review          = "Can you review {file} for any issues or improvements?",
      tests           = "Can you write tests for {this}?",
      -- simple context prompts
      buffers         = "{buffers}",
      file            = "{file}",
      line            = "{line}",
      position        = "{position}",
      quickfix        = "{quickfix}",
      selection       = "{selection}",
      ["function"]    = "{function}",
      class           = "{class}",j
    },
    picker = "fzf-lua"
  },
  copilot = {
    -- track copilot's status with `didChangeStatus`
    status = {
      enabled = true,
    },
  },
  ui = {
    icons = {
      attached          = " ",
      started           = " ",
      installed         = " ",
      missing           = " ",
      external_attached = "󰖩 ",
      external_started  = "󰖪 ",
      terminal_attached = " ",
      terminal_started  = " ",
    },
  },
  debug = false, -- enable debug logging
})

vim.keymap.set({ "n", "t", "i", "x" }, "<c-l>", function() require("sidekick.cli").toggle({ name = "copilot", focus = true }) end, { noremap = true, silent = true })
vim.keymap.set({ "n", "x"}, "<c-p>", function() require("sidekick.cli").prompt() end, { noremap = true, silent = true })
vim.keymap.set({ "x" }, "<leader>av", function() require("sidekick.cli").send({ msg = "{selection}" }) end, { noremap = true, silent = true })
vim.keymap.set({ "n" }, "<leader>af", function() require("sidekick.cli").send({ msg = "{file}" }) end, { noremap = true, silent = true })
vim.keymap.set({ "n", "x" }, "<leader>at", function() require("sidekick.cli").send({ msg = "{this}" }) end, { noremap = true, silent = true })
vim.keymap.set({ "n" }, "<leader>ad", function() require("sidekick.cli").close() end, { noremap = true, silent = true })
