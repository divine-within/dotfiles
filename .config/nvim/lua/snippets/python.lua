local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local c = ls.choice_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

return {
    s(
        { trig = "def", dscr = "Function snippet." },
        fmta(
            [[
            def <>(<>):
                <><>
            ]],
            {
                i(1, { "name" }),
                i(2),
                c(3, {
                    t("return "),
                    t("pass"),
                    i(nil, ""),
                }),
                i(0),
            }
        )
    ),
    s(
        { trig = "defs", dscr = "Class method (s) snippet." },
        fmta(
            [[
            def <>(self, <>):
                <><>
            ]],
            {
                i(1, { "name" }),
                i(2),
                c(3, {
                    t("return "),
                    t("pass"),
                    i(nil, ""),
                }),
                i(0),
            }
        )
    ),
    s(
        { trig = "defc", dscr = "Class method (c) snippet." },
        fmta(
            [[
            @classmethod
            def <>(cls, <>):
                <><>
            ]],
            {
                i(1, { "name" }),
                i(2),
                c(3, {
                    t("return "),
                    t("pass"),
                    i(nil, ""),
                }),
                i(0),
            }
        )
    ),
    s(
        { trig = "defst", dscr = "Static class method snippet." },
        fmta(
            [[
            @staticmethod
            def <>(<>):
                <><>
            ]],
            {
                i(1, { "name" }),
                i(2),
                c(3, {
                    t("return "),
                    t("pass"),
                    i(nil, ""),
                }),
                i(0),
            }
        )
    ),
    s(
        { trig = "adef", dscr = "Async function snippet." },
        fmta(
            [[
            async def <>(<>):
                <><>
            ]],
            {
                i(1, { "name" }),
                i(2),
                c(3, {
                    t("return "),
                    t("pass"),
                    i(nil, ""),
                }),
                i(0),
            }
        )
    ),
    s(
        { trig = "cls", dscr = "Class snippet" },
        fmta(
            [[
            class <>(<>):
                def __init__(self, <>):
                    <>
            ]],
            {
                i(1, { "name" }),
                i(2),
                i(3),
                i(0),
            }
        )
    ),
    s(
        { trig = "s", dscr = "Class instance abbreviation snippet." },
        fmta("self.<><>", {
            i(1, "var"),
            i(0),
        })
    ),
    s(
        { trig = "with", dscr = "Context manager snippet." },
        fmta(
            [[
        with <> as <>:
            <>
        ]],
            {
                c(1, {
                    sn(nil, {
                        t("open("),
                        i(1),
                        t(")"),
                    }),
                    i(nil, ""),
                }),
                i(2),
                i(0),
            }
        )
    ),
    s(
        { trig = "lambda", dscr = "Lambda function" },
        fmta("lambda <>: <>", {
            i(1, "parameter_list"),
            i(0, "expression"),
        })
    ),
    s(
        { trig = "ifmain", dscr = 'Snippet for a `if __name__ == "__main__": ...` block' },
        fmta(
            [[
            if __name__ == "__main__":
                <>
            ]],
            {
                i(0, "pass"),
            }
        )
    ),
}
