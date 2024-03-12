local ls = require('luasnip')
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local c = ls.choice_node

return {
    s({ trig = 'fn', dscr = 'Function snippet' },
        {
            t('def '),
            i(1, { 'name' }),
            t('('),
            i(2),
            t({ '):', '\t' }),
            i(3)
        }),
}
