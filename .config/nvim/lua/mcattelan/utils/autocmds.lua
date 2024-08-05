local M = {}

-- Wrapper around `vim.api.nvim_create_augroup()` with sane defaults and custom
-- name concatenation.
M.nvim_create_augroup = function(augroup_name)
  return vim.api.nvim_create_augroup("mcattelan_" .. augroup_name, { clear = true })
end

return M
