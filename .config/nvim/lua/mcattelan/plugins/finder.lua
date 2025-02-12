return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
  opts = {
    defaults = require("telescope.themes").get_ivy({
      layout_config = {
        preview_width = 80,
      },
      preview = {
        hide_on_startup = true,
      },
      borderchars = {
        preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
      },
      mappings = {
        i = {
          ["<C-h>"] = function(...)
            return require("telescope.actions.layout").toggle_preview(...)
          end,
        },
      },
    }),
    extensions = {
      fzf = {},
    },
  },
  config = function(_, opts)
    require("telescope").setup(opts)
    require("telescope").load_extension("fzf")

    -- Find files using current working directory as base directory.
    vim.keymap.set("n", "<space>fd", function()
      require("telescope.builtin").find_files({ hidden = true })
    end)
    -- Find files using git's root of the working tree as base directory.
    vim.keymap.set("n", "<space>fg", function()
      require("telescope.builtin").git_files({ show_untracked = true })
    end)
    -- Find neovim's builtin help tags.
    vim.keymap.set("n", "<space>fh", require("telescope.builtin").help_tags)
    -- Grep word currently under cursor.
    vim.keymap.set("n", "<space>gc", require("telescope.builtin").grep_string)
    -- Grep word live.
    vim.keymap.set("n", "<space>gs", require("telescope.builtin").live_grep)
  end,
}
