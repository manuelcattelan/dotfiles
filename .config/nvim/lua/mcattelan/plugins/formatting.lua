return {
  "stevearc/conform.nvim",
  opts = function()
    return {
      formatters = {
        eslint_d = {
          cwd = require("conform.util").root_file({
            "eslint.config.js",
            "eslint.config.mjs",
            "eslint.config.cjs",
            "eslint.config.ts",
            "eslint.config.mts",
            "eslint.config.cts",
          }),
          require_cwd = true,
        },
      },
      formatters_by_ft = {
        lua = { "stylua" },

        javascript = { "prettierd", "eslint_d" },
        typescript = { "prettierd", "eslint_d" },

        vue = { "prettierd", "eslint_d" },
        css = { "prettierd" },

        c = { "clang-format" },
      },
    }
  end,
}
