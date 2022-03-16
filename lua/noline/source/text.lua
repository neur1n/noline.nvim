local Text = {}

function Text.byte(style)
  local expr = "%o"

  if style == "O" then
    expr = "%O"
  end

  return expr
end

function Text.char(style)
  local expr = "%b"

  if style == "B" then
    expr = "%B"
  end

  return expr
end

return Text
