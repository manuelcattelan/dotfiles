return {
  "williamboman/mason.nvim",
  build = ":MasonUpdate",
  opts = {
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
      border = "rounded",
    },
  },
  config = function(_, opts)
    local mason = require("mason")
    local mason_registry = require("mason-registry")

    mason.setup(opts)
    if mason_registry.refresh then
      mason_registry.refresh()
    end
  end,
}
