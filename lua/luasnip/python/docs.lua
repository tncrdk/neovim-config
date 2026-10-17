local line_begin = require("luasnip.extras.expand_conditions").line_begin
-- Abbreviations used in this article and the LuaSnip docs
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local d = ls.dynamic_node
local fmta = require("luasnip.extras.fmt").fmta

return {
    -- DOCS
    s({trig = "cc", snippetType="autosnippet"},
      fmta(
        [[
      """
      <>
      """
      ]],
        {
          d(1),
        }
      ),
      {condition = line_begin}
    ),
    -- FUNCTION PARAMETERS for use in docstrings, with heading
    s({trig="PP", snippetType="autosnippet"},
      fmta(
        [[
        Parameters
        ----------
        <> : `<>`
            <>
      ]],
        {
          i(1),
          i(2),
          i(3),
        }
      ),
      {condition = line_begin}
    ),
    -- FUNCTION RETURNS for use in docstrings, with heading
    s({trig="RR", snippetType="autosnippet"},
      fmta(
        [[
          Returns
          -------
          <>
              <>
        ]],
        {
          i(1),
          i(2),
        }
      ),
      {condition = line_begin}
    ),
    -- NOTES docstring section
    s({trig="NN", snippetType="autosnippet"},
      fmta(
        [[
          NOTES
          -----
        ]],
        { }
      ),
      {condition = line_begin}
    ),
    -- PRE-CONDITION docstring section
    s({trig="prr", snippetType="autosnippet"},
      fmta(
        [[
          Pre-Conditions
          --------------
        ]],
        { }
      ),
      {condition = line_begin}
    ),
    -- FUNCTION PARAMETER for use in docstrings
    s({trig="::", snippetType="autosnippet"},
      fmta(
        [[
      <> : <>
          <>
      ]],
        {
          i(1),
          i(2),
          i(3)
        }
      ),
      {condition = line_begin}
    ),
  }
