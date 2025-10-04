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
    enabled = function(buf)
      return vim.g.sidekick_nes ~= false and vim.b.sidekick_nes ~= false
    end,
    debounce = 100,
    trigger = {
      -- events that trigger sidekick next edit suggestions
      events = { "InsertLeave", "TextChanged", "User SidekickNesDone" },
    },
    clear = {
      -- events that clear the current next edit suggestion
      events = { "TextChangedI", "TextChanged", "BufWritePre", "InsertEnter" },
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
        width = 80,
        height = 20,
      },
      --- CLI Tool Keymaps
      --- default mode is `t`
      ---@type table<string, sidekick.cli.Keymap|false>
      keys = {
        stopinsert = { "<esc><esc>", "stopinsert", mode = "t" }, -- enter normal mode
        hide_n = { "q", "hide", mode = "n" }, -- hide from normal mode
        hide_t = { "<c-q>", "hide" }, -- hide from terminal mode
        win_p = { "<c-w>p", "blur" }, -- leave the cli window
        blur = { "<c-o>", "blur" }, -- leave the cli window
        prompt = { "<c-p>", "prompt" }, -- insert prompt or context
        -- example of custom keymap:
        say_hi = {
          "<c-h>",
          function(t)
            t:send("hi!")
          end,
        },
      },
    },
    ---@class sidekick.cli.Mux
    ---@field backend? "tmux"|"zellij" Multiplexer backend to persist CLI sessions
    mux = {
      backend = "zellij",
      enabled = false,
    },
    ---@type table<string, sidekick.cli.Tool.spec>
    tools = {
      aider = { cmd = { "aider" }, url = "https://github.com/Aider-AI/aider" },
      claude = { cmd = { "claude" }, url = "https://github.com/anthropics/claude-code" },
      codex = { cmd = { "codex", "--search" }, url = "https://github.com/openai/codex" },
      copilot = { cmd = { "copilot", "--banner" }, url = "https://github.com/github/copilot-cli" },
      crush = {
        cmd = { "crush" },
        url = "https://github.com/charmbracelet/crush",
        keys = {
          -- crush uses <a-p> for its own functionality, so we override the default
          prompt = { "<a-p>", "prompt" }, -- insert prompt or context
        },
      },
      cursor = { cmd = { "cursor-agent" }, url = "https://cursor.com/cli" },
      gemini = { cmd = { "gemini" }, url = "https://github.com/google-gemini/gemini-cli" },
      grok = { cmd = { "grok" }, url = "https://github.com/superagent-ai/grok-cli" },
      opencode = { cmd = { "opencode" }, url = "https://github.com/sst/opencode" },
      qwen = { cmd = { "qwen" }, url = "https://github.com/QwenLM/qwen-code" },
    },
    ---@type table<string, sidekick.Prompt>
    prompts = {
      explain = "用中文解释一下这段代码",
      diagnostics = {
        msg = "What do the diagnostics in this file mean?",
        diagnostics = true,
      },
      diagnostics_all = {
        msg = "Can you help me fix these issues?",
        diagnostics = { all = true },
      },
      fix = {
        msg = "你能帮我解决代码中的这些问题吗",
        diagnostics = true,
      },
      review = {
        msg = "Can you review this code for any issues or improvements? 用中文回答， 用 markdown 的格式返回答案  ",
        diagnostics = true,
      },
      optimize = "How can this code be optimized?",
      tests = "Can you write tests for this code?",
      file = { location = { row = false, col = false } },
      position = {},
    },
  },
  copilot = {
    -- track copilot's status with `didChangeStatus`
    status = {
      enabled = true,
    },
  },
  debug = true, -- enable debug logging
})


-- vim.keymap.set({ "n", "v", "t" }, "<c-p>", function() require("sidekick.cli").toggle({ name = "opencode", focus = true }) end, { noremap = true, silent = true })
vim.keymap.set({ "n", "v", "t" }, "<c-p>", function() require("sidekick.cli").toggle({ name = "copilot", focus = true }) end, { noremap = true, silent = true })
-- vim.keymap.set({ "n", "x", "i", "t" }, "<c-.>", function() require("sidekick.cli").focus() end, { noremap = true, silent = true })
-- vim.keymap.set({ "n", "i" }, "<c-.>", function() require("sidekick.cli").focus() end, { noremap = true, silent = true })
-- vim.keymap.set({ "n", "x", "i", "t" }, "<leader>ab", "<cmd>Sidekick cli focus<CR>", { noremap = true, silent = false })
  -- keys = {
  --   {
  --     "<tab>",
  --     function()
  --       -- if there is a next edit, jump to it, otherwise apply it if any
  --       if not require("sidekick").nes_jump_or_apply() then
  --         return "<Tab>" -- fallback to normal tab
  --       end
  --     end,
  --     expr = true,
  --     desc = "Goto/Apply Next Edit Suggestion",
  --   },
  --   -- Example of a keybinding to open Claude directly
  -- },
