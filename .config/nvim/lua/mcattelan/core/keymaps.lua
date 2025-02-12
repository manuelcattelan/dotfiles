-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Source current buffer.
vim.keymap.set("n", "<space><space>x", "<CMD>source %<CR>")
-- Source current line, where cursor is.
vim.keymap.set("n", "<space>x", ":.lua<CR>")
-- Source selected lines in VISUAL mode.
vim.keymap.set("v", "<space>x", ":lua<CR>")

-- Avoid `q:` typo instead of `:q` for closing current buffer.
vim.keymap.set("n", "q:", "<nop>")
-- Disable highlight on search (usually triggered by `/` or `?` commands).
vim.keymap.set("n", "<Esc>", "<CMD>nohlsearch<CR>")

-- Copy selected text to system clipboard.
vim.keymap.set("v", "<leader>y", '"+y')
-- Replace selected text without yanking.
vim.keymap.set("v", "<leader>p", '"_dP')
-- Delete selected text without yanking.
vim.keymap.set("v", "<leader>d", '"-d')

-- Close all windows except the current one.
vim.keymap.set("n", "<leader>w", "<CMD>only<CR>")
-- Close all tabs except the current one.
vim.keymap.set("n", "<leader>t", "<CMD>tabonly<CR>")

-- Navigate between open windows more easily.
vim.keymap.set("n", "<C-h>", "<C-w><C-h>")
vim.keymap.set("n", "<C-j>", "<C-w><C-j>")
vim.keymap.set("n", "<C-k>", "<C-w><C-k>")
vim.keymap.set("n", "<C-l>", "<C-w><C-l>")
