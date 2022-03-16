local api = vim.api

local Highlight = {}

--[[
@brief Creates new highlight group(s).
@param[in] group   string:  Name of the target highlight group.
@param[in] fg      string?: Should be a number (256 RGB), string (HEX RGB), or a
                            table. If a table is provided, it should follow the
                            format (for example):

                              {["c"] = 167, ["g"] = "#dd6151"}

                            where "c" for cterm, "g" for gui.
                            If not provided, "NONE" is used.

@param[in] bg      string?: Same as fg. If not provided, use value of fg.
@param[in] attr    string?: If not provided, "NONE" is used.
@param[in] special string?: If not provided, "NONE" is used.
@param[in] gui    string?: If not provided, "NONE" is used.
@param[in] font   string?: If not provided, "NONE" is used.
--]]
function Highlight.create(group, fg, bg, attr, special, font)
  local ctermfg = "NONE"
  local ctermbg = "NONE"
  local guifg = "NONE"
  local guibg = "NONE"

  if type(fg) == "table" then
    ctermfg = fg["c"]
    guifg = fg["g"]
  elseif type(fg) == "number" or type(fg) == "string" then
    ctermfg = fg
    guifg = fg
  end

  if type(bg) == "table" then
    ctermbg = bg["c"]
    guibg = bg["g"]
  elseif type(bg) == "number" or type(bg) == "string" then
    ctermbg = bg
    guibg = bg
  end

  if attr == nil then
    attr = "NONE"
  end

  if special == nil then
    special = "NONE"
  end

  if font == nil then
    font = "NONE"
  end

  local cmd = "highlight! " .. group
      .. " cterm=" .. attr .. " ctermfg=" .. ctermfg .. " ctermbg=" .. ctermbg
      .. " gui=" .. attr .. " guifg=" .. guifg .. " guibg=" .. guibg
      .. " guisp=" .. special .. " font=" .. font

  api.nvim_command(cmd)
end

function Highlight.clear(group)
  api.nvim_command("highlight! clear " .. group)
end

function Highlight.link(from, to)
  api.nvim_command(string.format("highlight! link %s %s", from, to))
end

return Highlight
