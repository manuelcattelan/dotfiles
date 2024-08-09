return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  -- stylua: ignore
  keys = function()
    local harpoon = require("harpoon")
    local harpoon_menu_options = { title_pos = "center" }

    local keys = {
      { "<leader>H", function() harpoon.ui:toggle_quick_menu(harpoon:list(), harpoon_menu_options) end, desc = "Open [H]arpoon Menu" },
      { "<leader>ha", function() harpoon:list():add() end, desc = "[H]arpoon [Add] File" },
      { "<C-p>", function() harpoon:list():prev() end, desc = "Move To The [P]revious Harpoon Mark" },
      { "<C-n>", function() harpoon:list():next() end, desc = "Move To The [N]ext Harpoon Mark" },
    }

    for _, idx in ipairs({ 1, 2, 3, 4, 5 }) do
      table.insert(keys, {
        string.format("<space>%d", idx),
        function()
          harpoon:list():select(idx)
        end,
      })
    end

    return keys
  end,
  config = true,
}
