return {
  "L3MON4D3/LuaSnip",
  -- follow latest release.
  version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  -- install jsregexp (optional!).
  build = "make install_jsregexp",
  dependencies = {
    "rafamadriz/friendly-snippets",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
  -- stylua: ignore
  keys = {
    { "<C-h>", function() require("luasnip").jump(-1) end, mode = { "i", "s" }, },
    { "<C-l>", function() require("luasnip").jump(1) end, mode = { "i", "s" }, },
  },
}
