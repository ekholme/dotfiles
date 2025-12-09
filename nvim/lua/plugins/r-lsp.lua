return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Configuration for the R Language Server (r_language_server)
        r_language_server = {
          -- The command to run the language server
          cmd = {
            "R",
            "--slave",
            "-e",
            "languageserver::run()"
          },
          -- Auto-detect R files
          filetypes = { "r", "R", "rprofile" },
          -- Optional: Customize settings like project library path
          settings = {
            r = {
              lsp = {
                diagnostics = true,
                signatureHelp = true,
                hover = true,
              },
              -- Set your library path if you use custom R library locations
              -- library = "~/.local/share/R/library" 
            },
          },
        },
      },
    },
  },
}
