return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-tree/nvim-web-devicons" },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  -- stylua: ignore
  keys = function()
    local builtin = require("telescope.builtin")

    return {
      { "<leader>pf", function() builtin.find_files({ hidden = true }) end, desc = "[P]roject [F]iles" },
      { "<leader>pg", function() builtin.git_files({ show_untracked = true }) end, desc = "[P]roject [G]it Files" },
      { "<leader>pw", builtin.grep_string, desc = "[P]roject Current [W]ord" },
      { "<leader>pr", builtin.live_grep, desc = "[P]roject Current [R]eferences" },
    }
  end,
  opts = {
    defaults = {
      layout_config = {
        preview_width = 80,
        prompt_position = "top",
      },
      sorting_strategy = "ascending",
      preview = {
        hide_on_startup = true,
      },
      borderchars = {
        prompt = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        results = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
      },
      mappings = {
        i = {
          ["<C-h>"] = function(...)
            return require("telescope.actions.layout").toggle_preview(...)
          end,
        },
      },
    },
  },
  config = function(_, opts)
    local telescope = require("telescope")

    telescope.setup(opts)
    telescope.load_extension("fzf")
  end,
}
