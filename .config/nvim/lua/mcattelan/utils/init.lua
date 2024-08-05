local M = {}

setmetatable(M, {
  __index = function(t, k)
    t[k] = require("mcattelan.utils." .. k)
    return t[k]
  end,
})

return M
