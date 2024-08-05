local M = {}

-- Wrapper around `vim.keymap.set()` with sane defaults.
M.map_key = function(mode, key, command, options)
  options = options or {}

  options.silent = options.silent ~= false
  options.noremap = options.noremap ~= true

  vim.keymap.set(mode, key, command, options)
end

return M
