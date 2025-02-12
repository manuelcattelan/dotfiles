return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    style = "night",
    styles = {
      comments = { italic = false },
      keywords = { italic = false },
      -- Background styles. Can be "dark", "transparent" or "normal"
      sidebars = "normal", -- style for sidebars, see below
      floats = "normal", -- style for floating windows
    },
    lualine_bold = true,

    --- You can override specific highlights to use other groups or a hex color
    --- function will be called with a Highlights and ColorScheme table
    ---@param highlights tokyonight.Highlights
    ---@param colors ColorScheme
    on_highlights = function(highlights, colors)
      -- Override border for common float windows.
      highlights.FloatTitle = { fg = colors.fg_dark }
      highlights.FloatBorder = { fg = colors.fg_dark }

      -- Override highlights for windows separator line.
      highlights.WinSeparator = { fg = colors.fg_dark }

      -- Override highlights for `blink.cmp` plugin.
      highlights.BlinkCmpDocBorder = { fg = colors.fg_dark }

      -- Override highlights for telescope plugin.
      highlights.TelescopeBorder = { fg = colors.fg_dark }
      highlights.TelescopePromptBorder = { fg = colors.fg_dark }
      highlights.TelescopePromptTitle = { fg = colors.fg_dark }
    end,
  },
  config = function(_, opts)
    require("tokyonight").setup(opts)
    vim.cmd.colorscheme("tokyonight")
  end,
}
