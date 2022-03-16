local Buffer = {}

--[[
@brief Get the current column number. See ":h statusline".
@param[in] style   number: Should be "c", "V" or "v" (default).
@param[in] length? number: Can be used to specify the minimal length of output.
--]]
function Buffer.column(style, length)
  local sty = "v"
  local len = ""

  if style == "c" or style == "V" then
    sty = style
  end

  if type(length) == "number" then
    len = tostring(length)
  end

  return "%" .. len .. sty
end


--[[
" @brief Get the current column number. See ":h statusline".
" @param[in] length? number: To specify the minimal length of output.
]]
function Buffer.line(length)
  local len = ""

  if type(length) == "number" then
    len = tostring(length)
  end

  return "%" .. len .. "l"
end

--[[
@brief Get the line count of the file.
--]]
function Buffer.line_count()
  return "%L"
end

--[[
@brief Get the buffer number.
--]]
function Buffer.number()
  return "%n"
end

--[[
@brief Get the percentage through file. See ':h statusline'.
@param[in] style? string: Shoule be either "P" or "p" (default).
--]]
function Buffer.percentage(style)
  local expr = "%p"

  if style == "P" then
    expr = "%P"
  end

  return expr
end

return Buffer
