local ls = require('luasnip')
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local c = ls.choice_node

return {
    s({ trig = 'fn', dscr = 'Function snippet' }, {
        t('func '),
        i(1, { 'name' }),
        t('('),
        i(2),
        t(') '),
        c(3, {
            i(1, { 'type' }),
            t('')
        }),
        t({ ' {', '\t' }),
        t(' ̈́'),
        i(0, { '// Instructions' }),
        t({ '', '}' }),
    }),
    s({ trig = 'st', dscr = 'Struct snippet' }, {
        t('type'),
        t('test'),
    })
}
