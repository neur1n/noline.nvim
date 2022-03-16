local Component = {}

--[[
  @brief Creates a statusline component.
  @param[in] content    table:  A list of content expressions of the component.
  @param[in] hlgroup?   string: Optional highlight group of the component.
  @return[out] Returns an expression that can be evaluated by statusline.
--]]
function Component.create(content, hlgroup)
  assert(type(content) == "string" or type(content) == "table",
      "Content must be a string or a table.")
  local expr = ""

  if type(content) == "string" then
    expr = content
  elseif type(content) == "table" then
    expr = table.concat(content)
  end

  local hl = ""

  if type(hlgroup) == "string" and hlgroup ~= "" then
    hl = hlgroup
  end

  return "%#" .. hl .. "#" .. expr
end

--[[
@param[in] str              string: Some string.
@param[in, optional] left?  string: Decorator to be put before str.
@param[in, optional] right? string: Decorator to be put after str.
--]]
function Component.decorate(str, left, right)
  if type(left) == "string" then
    str = left .. str
  end

  if type(right) == "string" then
    str = str .. right
  end

  return str
end

return Component
