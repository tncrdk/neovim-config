-- Abbreviations used in this article and the LuaSnip docs
local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta
local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
    s({ trig = "cde", snippetType = "autosnippet", desc = "A hellow world snippet", wordTrig = true },
    fmta(
        [[
        ```<>
        <>
        ```
        ]],
        {
          i(1),
          i(2),
        },
      { condition = line_begin }
    )
   ),
}
