local fn = vim.fn
local opt = vim.o

local File = {}

local Component = require("noline.utility.component")

function File.current_dir()
  return fn.expand("%:p:h:t")
end

function File.encoding(l_decor, r_decor)
  local expr = ""

  if opt.fileencoding ~= "" then
    expr = opt.fileencoding
  elseif opt.encoding ~= "" then
    expr = opt.encoding
  else
    return expr
  end

  return Component.decorate(expr, l_decor, r_decor)
end

function File.format(l_decor, r_decor)
  return Component.decorate(opt.fileformat, l_decor, r_decor)
end

function File.full_dir()
  return fn.expand("%:p:h")
end

function File.full_path()
  return fn.expand("%:p")
end

function File.name()
  return "%t"
end

function File.relative_path()
  return "%f"
end

function File.type(style)
  local expr = "%y"

  if style == "Y" then
    expr = "%Y"
  end

  return expr
end

return File
