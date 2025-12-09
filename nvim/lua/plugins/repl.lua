-- ~/.config/nvim/lua/plugins/repl.lua
return {
  {
    "jpalardy/vim-slime",
    lazy = false, -- Load immediately since it's used for basic interaction
    -- These are example options, adjust them based on your terminal setup
    init = function()
      vim.g.slime_target = "tmux"
      -- The tmux pane to send the code to.
      -- This example targets the pane on the right (relative to the code pane)
      vim.g.slime_default_config = {
        ["tmux"] = {
          target = ":.1"
        }
      }
    end,
    -- Recommended keymaps for Julia (or any language)
    keys = {
      { "<leader>rs", "<Plug>SlimeSendVisual", mode = "v",                     desc = "Send Visual Selection" },
      { "<leader>rc", "<Plug>SlimeRegionSend", mode = "n",                     desc = "Send Block/Function" },
      { "<leader>rC", "<cmd>SlimeConfig<CR>",  desc = "Configure Slime Target" },
    },
  },
}
