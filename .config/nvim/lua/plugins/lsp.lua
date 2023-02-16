return {
    { "lvimuser/lsp-inlayhints.nvim" },
    {
        "neovim/nvim-lspconfig",
        dependencies = { "lvimuser/lsp-inlayhints.nvim" },
        config = function()
            local lspconfig = require("lspconfig")

            lspconfig.gopls.setup({
                on_attach = function(client, bufnr)
                    require("settings/shared").on_attach(client, bufnr)
                    require("lsp-inlayhints").setup({
                        inlay_hints = {
                            type_hints = {
                                prefix = "=> "
                            },
                        },
                    })
                    require("lsp-inlayhints").on_attach(client, bufnr)
                    require("illuminate").on_attach(client)
                end,
                settings = {
                    gopls = {
                        analyses = {
                            nilness = true,
                            unusedparams = true,
                            unusedwrite = true,
                            useany = true,
                        },
                        experimentalPostfixCompletions = true,
                        gofumpt = true,
                        staticcheck = true,
                        usePlaceholders = true,
                        hints = {
                            assignVariableTypes = true,
                            compositeLiteralFields = true,
                            compositeLiteralTypes = true,
                            constantValues = true,
                            functionTypeParameters = true,
                            parameterNames = true,
                            rangeVariableTypes = true,
                        }
                    },
                },
            })

            lspconfig.pyright.setup({})
            lspconfig.tsserver.setup({})
            lspconfig.lua_ls.setup({})
            lspconfig.yamlls.setup({})
            lspconfig.marksman.setup({})
            lspconfig.eslint.setup({})
        end
    },

    { "williamboman/mason.nvim",
        config = true,
    },

    { "Afourcat/treesitter-terraform-doc.nvim" },
    { "williamboman/mason-lspconfig.nvim",
        lazy = true,
        dependencies = { "williamboman/mason.nvim" },
        config = true,
    },

    { "simrat39/symbols-outline.nvim",
        opts = {
            -- autofold_depth = 1, -- h: close, l: open, W: close all, E: open all
            auto_close = false,
            highlight_hovered_item = true,
            position = "left",
            width = 15,
            symbols = {
                File = { icon = "", hl = "GruvboxAqua" }, -- TSURI
                Module = { icon = "", hl = "GruvboxBlue" }, -- TSNamespace
                Namespace = { icon = "", hl = "GruvboxBlue" }, -- TSNamespace
                Package = { icon = "", hl = "GruvboxBlue" }, -- TSNamespace
                Class = { icon = "𝓒", hl = "GruvboxGreen" }, -- TSType
                Method = { icon = "ƒ", hl = "GruvboxOrange" }, -- TSMethod
                Property = { icon = "", hl = "GruvboxOrange" }, -- TSMethod
                Field = { icon = "", hl = "GruvboxRed" }, -- TSField
                Constructor = { icon = "", hl = "TSConstructor" },
                Enum = { icon = "ℰ", hl = "GruvboxGreen" }, -- TSType
                Interface = { icon = "ﰮ", hl = "GruvboxGreen" }, -- TSType
                Function = { icon = "", hl = "GruvboxYellow" }, -- TSFunction
                Variable = { icon = "", hl = "GruvboxPurple" }, -- TSConstant
                Constant = { icon = "", hl = "GruvboxPurple" }, -- TSConstant
                String = { icon = "𝓐", hl = "GruvboxGray" }, -- TSString
                Number = { icon = "#", hl = "TSNumber" },
                Boolean = { icon = "⊨", hl = "TSBoolean" },
                Array = { icon = "", hl = "GruvboxPurple" }, -- TSConstant
                Object = { icon = "⦿", hl = "GruvboxGreen" }, -- TSType
                Key = { icon = "🔐", hl = "GruvboxGreen" }, -- TSType
                Null = { icon = "NULL", hl = "GruvboxGreen" }, -- TSType
                EnumMember = { icon = "", hl = "GruvboxRed" }, -- TSField
                Struct = { icon = "𝓢", hl = "GruvboxGreen" }, -- TSType
                Event = { icon = "🗲", hl = "GruvboxGreen" }, -- TSType
                Operator = { icon = "+", hl = "TSOperator" },
                TypeParameter = { icon = "𝙏", hl = "GruvboxRed" } --TTSParameter
            },
        }
    },

    { "mfussenegger/nvim-lint",
        config = function()
            local lint = require("lint")
            lint.linters_by_ft = {
                go = { "golangcilint" }, -- ~/.golangci.yml
            }
            -- see ./lsp.lua for calls to this plugin's try_lint() function.
        end
    },
}
