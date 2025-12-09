return {
  "jalvesaq/Nvim-R",
  ft = "r", -- Only load this plugin for R filetypes
  init = function()
    -- Set global variables for Nvim-R
    vim.g.R_set_width = 1
    vim.g.R_in_buffer = 1  -- Use a Neovim terminal buffer instead of a separate tmux/screen session
    vim.g.R_args = ""
  end,
  -- Keymaps for Nvim-R (using your local leader '\')
  keys = {
    -- The core command to start the R console/REPL
    { "\\rf", "<cmd>RCode<CR>", desc = "Nvim-R: Start R Console" },
    -- Send the current line to the R console
    { "\\l", "<Plug>RDSendLine", desc = "Nvim-R: Send Line" },
    -- Send the current selection to the R console (visual mode)
    { "\\s", "<Plug>RDSendSelection", mode = "v", desc = "Nvim-R: Send Selection" },
    -- Send the entire file to the R console
    { "\\aa", "<Plug>RDSendFile", desc = "Nvim-R: Send File" },
  },
}
