return {
  "folke/trouble.nvim",
  -- stylua: ignore
  keys = {
    { "<leader>X", "<CMD>Trouble diagnostics toggle<CR>", desc = "Toggle Trouble Menu" },
    { "<leader>xb", "<CMD>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Toggle [B]uffer Trouble Menu" },
  },
  config = true,
}
