local M = {}

local Component = require("noline.utility.component")

function M.button(symbol, l_decor, r_decor)
  if #vim.api.nvim_list_tabpages() == 1 then
    return ""
  end

  local expr = "%999XX"

  if type(symbol) == "string" and symbol ~= "" then
    expr = "%999X" .. symbol
  end

  return Component.decorate(expr, l_decor, r_decor)
end

return M
