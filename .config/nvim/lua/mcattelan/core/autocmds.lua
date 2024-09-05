local utils = require("mcattelan.utils")

local function organize_imports()
  vim.lsp.buf.execute_command({
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
  })
end

-- Add custom autocmd that highlights text region after
-- yanking (copying) it.
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight text region when yanking (copying)",
  group = utils.autocmds.nvim_create_augroup("highlight-yank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Organize imports on save for typescript files by leveraging
-- the Typescript language server.
vim.api.nvim_create_autocmd("BufWritePre", {
  desc = "Organize imports on save for typescript files",
  group = utils.autocmds.nvim_create_augroup("organize-imports"),
  pattern = "*.ts",
  callback = organize_imports,
})
