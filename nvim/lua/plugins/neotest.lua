return {
  "nvim-neotest/neotest",
  dependencies = {
    "Issafalcon/neotest-dotnet",
    "marilari88/neotest-vitest",
  },
  opts = {
    adapters = {
      ["neotest-dotnet"] = { runner = "xunit" },
      ["neotest-vitest"] = {},
    },
  },
}
