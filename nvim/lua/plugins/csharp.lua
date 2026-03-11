return {
  -- Disable OmniSharp from the lang.dotnet extra
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        omnisharp = { enabled = false },
      },
    },
  },

  -- Roslyn LSP (modern C# language server used by VS Code & Visual Studio)
  {
    "seblj/roslyn.nvim",
    ft = "cs",
    opts = {},
  },
}
