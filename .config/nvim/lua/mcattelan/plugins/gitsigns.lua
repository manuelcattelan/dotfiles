return {
  "lewis6991/gitsigns.nvim",
  opts = {
    on_attach = function(bufnr)
      local utils = require("mcattelan.utils")
      local gitsigns = package.loaded.gitsigns

      local function map_gitsigns_key(mode, key, command, options)
        options = options or {}
        options.buffer = bufnr

        utils.keymaps.map_key(mode, key, command, options)
      end

      -- Navigation
      map_gitsigns_key("n", "]h", gitsigns.next_hunk, { desc = "Go To Next [H]unk" })
      map_gitsigns_key("n", "[h", gitsigns.prev_hunk, { desc = "Go To Previous [H]unk" })

      -- Actions
      map_gitsigns_key({ "n", "v" }, "<leader>hs", gitsigns.stage_hunk, { desc = "[H]unk [S]tage" })
      map_gitsigns_key({ "n", "v" }, "<leader>hr", gitsigns.reset_hunk, { desc = "[H]unk [R]eset" })
      map_gitsigns_key("n", "<leader>hS", gitsigns.stage_buffer, { desc = "[H]unk [S]tage Buffer" })
      map_gitsigns_key("n", "<leader>hR", gitsigns.reset_buffer, { desc = "[H]unk [R]eset Buffer" })
      map_gitsigns_key("n", "<leader>hu", gitsigns.undo_stage_hunk, { desc = "[H]unk [U]ndo" })
      map_gitsigns_key("n", "<leader>hp", gitsigns.preview_hunk, { desc = "[H]unk [P]review" })
      map_gitsigns_key("n", "<leader>hd", gitsigns.diffthis, { desc = "[H]unk [D]iff" })
      map_gitsigns_key("n", "<leader>td", gitsigns.toggle_deleted, { desc = "[T]oggle [D]eleted" })
    end,
  },
}
