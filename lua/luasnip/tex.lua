-- Abbreviations used in this article and the LuaSnip docs
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep


table_node = function(args)
    local tabs = {}
    local count
    table = args[1][1]:gsub("%s", ""):gsub("|", "")
    count = table:len()
    for j = 1, count do
        local iNode
        iNode = i(j)
        tabs[2 * j - 1] = iNode
        if j ~= count then
            tabs[2 * j] = t " & "
        end
    end
    return sn(nil, tabs)
end

rec_table = function()
    return sn(nil, {
        c(1, {
            t({ "" }),
            sn(nil, { t { "\\\\", "" }, d(1, table_node, { ai[1] }), d(2, rec_table, { ai[1] }) })
        }),
    });
end

return {
    s("table", {
        t "\\begin{tabular}{",
        i(1, "0"),
        t { "}", "" },
        d(2, table_node, { 1 }, {}),
        d(3, rec_table, { 1 }),
        t { "", "\\end{tabular}" }
    }),

    -- Combining text and insert nodes to create basic LaTeX commands
    s({ trig = "tt", dscr = "Expands 'tt' into '\texttt{}'" },
        {
            t("\\texttt{"), -- remember: backslashes need to be escaped
            i(1),
            t("}"),
        }
    ),

    -- there is a much better, human-readable solution: ls.fmt, described shortly.
    s({ trig = "ff", dscr = "Expands 'ff' into '\frac{}{}'" },
        {
            t("\\frac{"),
            i(1), -- insert node 1
            t("}{"),
            i(2), -- insert node 2
            t("}")
        }
    ),

    -- Greek letter snippets, autotriggered for efficiency
    s({ trig = ";a", snippetType = "autosnippet" },
        {
            t("\\alpha"),
        }
    ),
    s({ trig = ";b", snippetType = "autosnippet" },
        {
            t("\\beta"),
        }
    ),
    s({ trig = ";g", snippetType = "autosnippet" },
        {
            t("\\gamma"),
        }
    ),
    s({ trig = ";m", snippetType = "autosnippet" },
        {
            t("\\mu"),
        }
    ),
    s({ trig = ";s", snippetType = "autosnippet" },
        {
            t("\\sigma"),
        }
    ),
    s({ trig = ";S", snippetType = "autosnippet" },
        {
            t("\\Sigma"),
        }
    ),
}
