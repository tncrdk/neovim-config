-- Abbreviations used in this article and the LuaSnip docs
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local line_begin = require("luasnip.extras.expand_conditions").line_begin


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
    s({ trig = "tit", dscr = "Expands 'tt' into '\textit{}'" },
        {
            t("\\textit{"), -- remember: backslashes need to be escaped
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
    -- FIGURE
    s({trig = "fig"},
      fmta(
        [[
        \begin{figure}[htb!]
          \centering
          \includegraphics[width=<>\linewidth]{<>}
          \caption{<>}
          \label{fig:<>}
        \end{figure}
        ]],
        {
          i(1),
          i(2),
          i(3),
          i(4),
        }
      ),
      { condition = line_begin }
    ),
}
