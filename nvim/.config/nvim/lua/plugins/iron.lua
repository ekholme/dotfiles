return {
  "Vigemus/iron.nvim",
  keys = {
    { "<leader>is", "<cmd>IronRepl<cr>", desc = "Iron: Start/Toggle REPL" },
    { "<leader>ir", "<cmd>IronRestart<cr>", desc = "Iron: Restart REPL" },
    { "<leader>if", "<cmd>IronFocus<cr>", desc = "Iron: Focus REPL Window" },
    -- Send code mappings (works across normal and visual modes)
    { "<leader>cx", mode = { "n", "v" }, desc = "Code: Send to REPL" },
    { "<leader>cX", mode = { "n" }, desc = "Code: Send Line to REPL" },
  },
  config = function()
    local iron = require("iron.core")

    iron.setup({
      config = {
        scratch_repl = false,
        -- Define your languages here
        repl_definition = {
          julia = {
            command = { "julia", "--banner=no" },
          },
          python = {
            -- Uses ipython if available, otherwise falls back to standard python3
            command = function(meta)
              local execution_cmd = vim.fn.executable("ipython") == 1 and "ipython" or "python3"
              return { execution_cmd }
            end,
          },
          r = {
            command = { "R", "--no-save" },
          },
        },
        -- Window layout: Opens in a 40% wide vertical split on the right
        repl_open_cmd = require("iron.view").split.vertical("40%"),
      },
      -- Keymaps to trigger evaluations
      keymaps = {
        send_motion = "<leader>cx", -- e.g., <leader>cxip to send "inner paragraph"
        visual_send = "<leader>cx", -- send highlighted text
        send_line = "<leader>cX", -- send current line
      },
      highlight = {
        italic = true,
      },
      ignore_blank_lines = true,
    })
  end,
}
