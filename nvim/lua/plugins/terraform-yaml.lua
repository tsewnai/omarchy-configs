return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        terraformls = {},
        yamlls = {
          settings = {
            yaml = {
              schemaStore = {
                -- Use the SchemaStore catalog for automatic schema detection
                enable = true,
                url = "https://www.schemastore.org/api/json/catalog.json",
              },
            },
          },
        },
      },
    },
  },
}
