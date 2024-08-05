local utils = require("mcattelan.utils")

-- Add custom autocmd that highlights text region after
-- yanking (copying) it.
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight text region when yanking (copying)",
  group = utils.autocmds.nvim_create_augroup("highlight-yank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})
