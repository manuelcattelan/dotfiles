local utils = require("mcattelan.utils")

-- Faster diagnostics navigation by specifying the preferred diagnostic
-- direction and severity to filter the current buffer's diagnostics.
local goto_diagnostic = function(diagnostic_direction, diagnostic_severity)
  local go = diagnostic_direction == "next" and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  local severity = diagnostic_severity and vim.diagnostic.severity[diagnostic_severity] or nil

  return function()
    go({ severity = severity })
  end
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Avoid `q:` typo instead of closing current buffer.
utils.keymaps.map_key("n", "q:", "<nop>", { desc = "Disable Command-line Window Keymap" })
-- Disable highlight on search (usually triggered by `/` or `?` commands).
utils.keymaps.map_key("n", "<Esc>", "<CMD>nohlsearch<CR>", { desc = "Disable Highlight On Search" })

-- Avoid cluttering Neovim's yank register when yanking/pasting/deleting.
utils.keymaps.map_key("v", "<leader>y", '"+y', { desc = "Copy Selected Text To System Clipboard" })
utils.keymaps.map_key("v", "<leader>p", '"_dP', { desc = "Replace Selected Text Without Yanking" })
utils.keymaps.map_key("v", "<leader>d", '"-d', { desc = "Delete Selected Text Without Yanking" })

-- Open float window that shows the current line's diagnostic error, if present.
utils.keymaps.map_key("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show Diagnostic [E]rror" })
-- Navigate current buffer's diagnostics with custom direction and filter options.
utils.keymaps.map_key("n", "[d", goto_diagnostic("prev"), { desc = "Go To Previous [D]iagnostic" })
utils.keymaps.map_key("n", "]d", goto_diagnostic("next"), { desc = "Go To Next [D]iagnostic" })
utils.keymaps.map_key("n", "[w", goto_diagnostic("prev", "WARN"), { desc = "Go To Previous [W]arning" })
utils.keymaps.map_key("n", "]w", goto_diagnostic("next", "WARN"), { desc = "Go To Next [W]arning" })
utils.keymaps.map_key("n", "[e", goto_diagnostic("prev", "ERROR"), { desc = "Go To Previous [E]rror" })
utils.keymaps.map_key("n", "]e", goto_diagnostic("next", "ERROR"), { desc = "Go To Next [E]rror" })

-- Navigate between open windows more easily.
utils.keymaps.map_key("n", "<C-h>", "<C-w><C-h>", { desc = "Move Focus To The Left Window" })
utils.keymaps.map_key("n", "<C-j>", "<C-w><C-j>", { desc = "Move Focus To The Lower Window" })
utils.keymaps.map_key("n", "<C-k>", "<C-w><C-k>", { desc = "Move Focus To The Upper Window" })
utils.keymaps.map_key("n", "<C-l>", "<C-w><C-l>", { desc = "Move Focus To The Right Window" })

-- Close all windows/tabs except the current one.
utils.keymaps.map_key("n", "<leader>w", "<CMD>only<CR>", { desc = "Close All Other [W]indows" })
utils.keymaps.map_key("n", "<leader>t", "<CMD>tabonly<CR>", { desc = "Close All Other [T]abs" })
