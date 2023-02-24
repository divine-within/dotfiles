return {
    {
        "L3MON4D3/LuaSnip",
        lazy = true,
        dependencies = { "saadparwaiz1/cmp_luasnip" },
        config = function()
            local ls = require('luasnip')
            local types = require('luasnip.util.types')

            ls.config.set_config({
                history = true,
                updateevents = "TextChanged, TextChangedI",
                autosnippets = true,
                ext_opts = {
                    [types.choiceNode] = {
                        active = {
                            virt_text = { { "<--", "Error" } }
                        }
                    }
                }
            })

            require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets" })
            -- Resource snippets
            vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/lua/plugins/luasnip.lua<CR>")
        end,
    },
}
