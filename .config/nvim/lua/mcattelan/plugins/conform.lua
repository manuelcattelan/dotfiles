return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      sh = { "beautysh" },
      zsh = { "beautysh" },
      lua = { "stylua" },

      javascript = { "prettierd" },
      typescript = { "prettierd" },
      vue = { "prettierd" },
    },
    format_on_save = {
      -- These options will be passed to conform.format()
      timeout_ms = 500,
      lsp_fallback = true,
    },
  },
}
