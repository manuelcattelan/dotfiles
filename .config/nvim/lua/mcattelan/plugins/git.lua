return {
  "lewis6991/gitsigns.nvim",
  opts = {
    on_attach = function(bufnr)
      local gitsigns = package.loaded.gitsigns

      local map = function(mode, lhs, rhs, opts)
        opts = opts or {}
        opts.buffer = bufnr

        vim.keymap.set(mode, lhs, rhs, opts)
      end

      -- Navigation
      map("n", "]h", gitsigns.next_hunk)
      map("n", "[h", gitsigns.prev_hunk)

      -- Actions
      map({ "n", "v" }, "<leader>hs", gitsigns.stage_hunk)
      map({ "n", "v" }, "<leader>hr", gitsigns.reset_hunk)
      map("n", "<leader>hS", gitsigns.stage_buffer)
      map("n", "<leader>hR", gitsigns.reset_buffer)
      map("n", "<leader>hu", gitsigns.undo_stage_hunk)
      map("n", "<leader>hp", gitsigns.preview_hunk)
      map("n", "<leader>hd", gitsigns.diffthis)
      map("n", "<leader>td", gitsigns.toggle_deleted)
    end,
  },
}
