-- Bootstrap lazy.nvim package manager if not already installed.
local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local lazy_repository = "https://github.com/folke/lazy.nvim.git"
if not (vim.uv or vim.loop).fs_stat(lazy_path) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    lazy_repository,
    lazy_path,
  })
end
-- Add lazy.nvim to the `runtimepath`, allowing to require it.
vim.opt.rtp:prepend(lazy_path)

-- Load core configuration files from my `lua/mcattelan/core` folder.
require("mcattelan.core.keymaps")
require("mcattelan.core.options")
require("mcattelan.core.autocmds")

-- Load lazy.nvim with plugins from my `lua/mcattelan/plugins` folder.
require("lazy").setup({
  spec = {
    { import = "mcattelan.plugins" },
  },
  install = {
    -- try to load one of these colorschemes when starting an installation during startup
    colorscheme = { "tokyonight" },
  },
  change_detection = {
    -- automatically check for plugin updates
    enabled = false,
  },
  ui = {
    -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
    border = "rounded",
    -- The backdrop opacity. 0 is fully opaque, 100 is fully transparent.
    backdrop = 100,
  },
})
