local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep
local extras = require("luasnip.extras")
local l = extras.l

return {
    s(
        "uses",
        fmt("const [{}, set{setter}] = useState({})", {
            i(1, "value"),
            i(2, "null"),
            setter = l(l._1:sub(1, 1):upper() .. l._1:sub(2, -1), 1)
        })
    ),
}
