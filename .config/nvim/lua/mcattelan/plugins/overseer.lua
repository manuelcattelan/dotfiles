return {
  "stevearc/overseer.nvim",
  opts = {
    dap = false,
  },
  config = function(_, opts)
    require("overseer").setup(opts)
  end,
}
