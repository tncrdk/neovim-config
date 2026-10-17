local line_begin = require("luasnip.extras.expand_conditions").line_begin
-- Abbreviations used in this article and the LuaSnip docs
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

return
  {
    -- math
    s({trig = "imm", snippetType="autosnippet"},
      {t("import math")},
      {condition = line_begin}
    ),
    -- sys
    s({trig = "iss", snippetType="autosnippet"},
      {t("import sys")},
      {condition = line_begin}
    ),
    -- Numpy
    s({trig = "inpp", snippetType="autosnippet"},
      {t("import numpy as np")},
      {condition = line_begin}
    ),
    -- Matplotlib
    s({trig = "impl", snippetType="autosnippet"},
      {t("import matplotlib.pyplot as plt")},
      {condition = line_begin}
    ),
    -- pathlib
    s({trig = "fipp", snippetType="autosnippet"},
      {t("from pathlib import Path")},
      {condition = line_begin}
    ),
  }
