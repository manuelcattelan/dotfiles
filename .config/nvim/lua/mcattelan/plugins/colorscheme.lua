return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
    styles = {
      -- Style to be applied to different syntax groups
      -- Value is any valid attr-list value for `:help nvim_set_hl`
      comments = { italic = false },
      keywords = { italic = false },
      -- Background styles. Can be "dark", "transparent" or "normal"
      sidebars = "normal", -- style for sidebars, see below
      floats = "normal", -- style for floating windows
    },
    --- You can override specific highlights to use other groups or a hex color
    --- function will be called with a Highlights and ColorScheme table
    ---@param highlights tokyonight.Highlights
    ---@param colors ColorScheme
    on_highlights = function(highlights, colors)
      -- Override border for common float windows.
      highlights.FloatTitle = { fg = colors.fg_dark }
      highlights.FloatBorder = { fg = colors.fg_dark }
      highlights.LspInfoBorder = { fg = colors.fg_dark }

      -- Override highlights for telescope plugin.
      highlights.TelescopeBorder = { fg = colors.fg_dark }
      highlights.TelescopePromptBorder = { fg = colors.fg_dark }
      highlights.TelescopePromptTitle = { fg = colors.fg_dark }

      -- Override highlights for nvim-cmp plugin.
      highlights.CmpItemAbbr = { fg = colors.fg_dark, italic = true }
      highlights.CmpItemAbbrDeprecated = { fg = colors.dark3, italic = true, strikethrough = true }

      -- Override highlights for windows separator line.
      highlights.WinSeparator = { fg = colors.fg_dark }
    end,
  },
  config = function(_, opts)
    require("tokyonight").setup(opts)
    vim.cmd.colorscheme("tokyonight")
  end,
}
