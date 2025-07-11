local api = vim.api
local opt = vim.o

local Edit = {}

local Component = require("noline.component")

Edit.default_mode_map = {
  ["abbr"] = {
    ["n"]    = "N"      ,
    ["no"]   = "OP"     ,
    ["nov"]  = "OP"     ,
    ["noV"]  = "OPL"    ,
    ["no"] = "OPB"    ,
    ["niI"]  = "NI"     ,
    ["niR"]  = "NR"     ,
    ["niV"]  = "NV"     ,
    ["nt"]   = "NT"     ,
    ["v"]    = "V"      ,
    ["vs"]   = "VS"     ,
    ["V"]   =  "VL"     ,
    ["Vs"]  =  "VLS"    ,
    [""]  =  "VB"     ,
    ["s"] =  "VBS"    ,
    ["s"]   =  "S"      ,
    ["S"]   =  "SL"     ,
    [""]  =  "SB"     ,
    ["i"]   =  "I"      ,
    ["ic"]  =  "IC"     ,
    ["ix"]  =  "IX"     ,
    ["R"]   =  "R"      ,
    ["Rc"]  =  "RC"     ,
    ["Rx"]  =  "RX"     ,
    ["Rv"]  =  "RV"     ,
    ["Rvc"] =  "RVC"    ,
    ["Rvx"] =  "RVX"    ,
    ["c"]   =  "C"      ,
    ["cv"]  =  "EX"     ,
    ["r"]   =  "ENTER"  ,
    ["rm"]  =  "MORE"   ,
    ["r?"]  =  "CONFIRM",
    ["!"]   =  "SHELL"  ,
    ["t"]   =  "TERM"   ,
    ["__"]  =  "-"      ,
  },
  ["full"] = {
    ["n"]    = "NORMAL"              ,
    ["no"]   = "O-PENDING"           ,
    ["nov"]  = "O-PENDING"           ,
    ["noV"]  = "O-PENDING-LINE"      ,
    ["no"] = "O-PENDING-BLOCK"     ,
    ["niI"]  = "N-INSERT"            ,
    ["niR"]  = "N-REPLACE"           ,
    ["niV"]  = "N-VIRTUAL"           ,
    ["nt"]   = "N-TERMINAL"          ,
    ["v"]    = "VISUAL"              ,
    ["vs"]   = "V-SELECT"            ,
    ["V"]    = "V-LINE"              ,
    ["Vs"]   = "V-LINE-SELECT"       ,
    [""]   = "V-BLOCK"             ,
    ["s"]  = "V-BLOCK-SELECT"      ,
    ["s"]    = "SELECT"              ,
    ["S"]    = "S-LINE"              ,
    [""]   = "S-BLOCK"             ,
    ["i"]    = "INSERT"              ,
    ["ic"]   = "I-COMPLETION"        ,
    ["ix"]   = "I-EXPAND"            ,
    ["R"]    = "REPLACE"             ,
    ["Rc"]   = "R-COMPLETION"        ,
    ["Rx"]   = "R-EXPAND"            ,
    ["Rv"]   = "R-VIRTUAL"           ,
    ["Rvc"]  = "R-VIRTUAL-COMPLETION",
    ["Rvx"]  = "R-VIRTUAL-EXPAND"    ,
    ["c"]    = "COMMAND"             ,
    ["cv"]   = "VIM-EX"              ,
    ["r"]    = "ENTER"               ,
    ["rm"]   = "MORE"                ,
    ["r?"]   = "CONFIRM"             ,
    ["!"]    = "SHELL"               ,
    ["t"]    = "TERMINAL"            ,
    ["__"]   = "-"                   ,
  }
}

--[[
@brief Get description of current editing mode.
@param[in] map                 table: A custom mode look up table.
                                      Edit.default_mode_map["abbr"] or
                                      Edit.default_mode_map["full"] or
                                      a user defined map can be used.
@param[in, optional] l_decor? string: Decorator to be put before the
                                      resulted mode symbol.
@param[in, optional] r_decor? string: Decorator to be put after the
                                      resulted mode symbol.
@return[out] Returns a string describing current mode.
--]]
function Edit.mode(map, l_decor, r_decor)
  assert(type(map) == "table", "Map should be a lookup table.")

  local expr = map[api.nvim_get_mode().mode]

  if expr == nil then
    expr = "UNKNOWN"
  end

  return Component.decorate(expr, l_decor, r_decor)
end

function Edit.modifiable(style, l_decor, r_decor)
  if opt.modifiable then
    return ""
  end

  local expr = ""

  if style == nil or style == "m" then
    expr = "%m"
  elseif style == "M" then
    expr = "%M"
  else
    expr = style
  end

  return Component.decorate(expr, l_decor, r_decor)
end

function Edit.modified(style, l_decor, r_decor)
  if not opt.modified then
    return ""
  end

  local expr = ""

  if style == nil or style == "m" then
    expr = "%m"
  elseif style == "M" then
    expr = "%M"
  else
    expr = style
  end

  return Component.decorate(expr, l_decor, r_decor)
end

function Edit.paste(style, l_decor, r_decor)
  if not opt.paste then
    return ""
  end

  local expr = ""

  if style == nil or style == "p" then
    expr = "paste"
  elseif style == "P" then
    expr = "PASTE"
  else
    expr = style
  end

  return Component.decorate(expr, l_decor, r_decor)
end

function Edit.readonly(style, l_decor, r_decor)
  if not opt.readonly then
    return ""
  end

  local expr = ""

  if style == nil or style == "r" then
    expr = "%r"
  elseif style == "R" then
    expr = "%R"
  else
    expr = style
  end

  return Component.decorate(expr, l_decor, r_decor)
end

function Edit.spell(style, l_decor, r_decor)
  if not opt.spell then
    return ""
  end

  local expr = ""

  if style == nil or style == "s" then
    expr = "spell"
  elseif style == "S" then
    expr = "SPELL"
  else
    expr = style
  end

  return Component.decorate(expr, l_decor, r_decor)
end

return Edit
