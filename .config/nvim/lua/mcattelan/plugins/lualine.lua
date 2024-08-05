return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      globalstatus = true,
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = {
        { "branch", icons_enabled = false },
        { "diff" },
      },
      lualine_c = {
        "%=",
        { "filetype", icon_only = true },
        { "filename", path = 4 },
      },
      lualine_x = {},
      lualine_y = {
        { "diagnostics", symbols = { error = "E:", warn = "W:", info = "I:", hint = "H:" } },
      },
      lualine_z = {
        { "location" },
        { "filetype", icons_enabled = false },
      },
    },
  },
}
