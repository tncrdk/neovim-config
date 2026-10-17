local line_begin = require("luasnip.extras.expand_conditions").line_begin
-- Abbreviations used in this article and the LuaSnip docs
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
    -- Main function
    s("ifmain", {
        t({ "if __name__ == \"__main__\":", "    " }),
        i(1, ""), -- Indented insert point for code
    }),
    -- shebang for scripts
    s({trig = "!!", snippetType="autosnippet"},
      {t("#!/usr/bin/env python")},
      {condition = line_begin}
    ),
}
