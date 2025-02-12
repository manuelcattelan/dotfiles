-- Show signcolumn in front of each line.
vim.opt.signcolumn = "yes"
-- Show the line number in front of each line.
vim.opt.number = true
-- Show the line number relative to the line with the cursor in front of
-- each line (especially useful when using motion commands).
vim.opt.relativenumber = true

-- Use the appropriate number of spaces to insert a <Tab>. To insert a real tab
-- when `expandtab` is on, use CTRL-V<Tab>.
vim.opt.expandtab = true
-- Number of spaces that a <Tab> in the file counts for.
vim.opt.tabstop = 4
-- Number of spaces that a <Tab> counts for while performing editing
-- operations, like inserting a <Tab> or using <BS>.
vim.opt.softtabstop = 4

-- Show partial off-screen results of user commands such as |:substitute|
-- live as you type in a preview window.
vim.opt.inccommand = "split"

-- Highlight pattern on search (clearable with <Esc> in normal mode).
vim.opt.hlsearch = true
-- Highlight text line of the cursor, useful to easily spot the cursor
-- but will make screen redrawing slower.
vim.opt.cursorline = true

-- Highlight column at exactly 80 characters width, useful to align text
-- but will make screen redrawing slower.
vim.opt.colorcolumn = "80"

-- Automatically keep the cursor line in the middle of the window, except
-- at the start or end of the file.
vim.opt.scrolloff = 999

-- Ignore case in search patterns unless it contains upper case characters.
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Set how new splits should be opened with respect to the current one.
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Lines will not wrap and only part of long lines will be displayed.
-- When the cursor is moved to a part that is not shown, the screen will scroll
-- horizontally.
vim.opt.wrap = false

-- Set maximum number of items to show in the popup menu.
vim.opt.pumheight = 10
