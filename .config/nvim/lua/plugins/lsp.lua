return {
    { "lvimuser/lsp-inlayhints.nvim" },
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim",
        config = true,
    },

    { "Afourcat/treesitter-terraform-doc.nvim" },
    { "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim", "lvimuser/lsp-inlayhints.nvim" },
        config = function()
            local lspconfig = require("lspconfig")
            require("mason-lspconfig").setup_handlers {

                -- Automatic server handler setup function
                function (server_name)
                    lspconfig[server_name].setup {}
                end,

                -- Next, you can provide a dedicated handler for specific servers.
                -- For example, a handler override for the `gopls`:
                ["gopls"] = function ()
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
                end
            }
        end
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

    { "jose-elias-alvarez/null-ls.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local null_ls = require("null-ls")

            local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

            null_ls.setup({
                sources = {
                    -- JavaScript, Typescript, etc.
                    null_ls.builtins.formatting.prettierd,
                    null_ls.builtins.diagnostics.eslint_d.with({
                        diagnostics_format = '[eslint] #{m}\n(#{c})'
                    }),

                    -- Python
                    null_ls.builtins.formatting.black,
                    null_ls.builtins.diagnostics.flake8,

                    -- Go
                    null_ls.builtins.formatting.gofmt,
                    null_ls.builtins.diagnostics.golangci_lint,
                },
                on_attach = function(client, bufnr)
                    if client.supports_method("textDocument/formatting") then
                        vim.api.nvim_buf_create_user_command(bufnr, "LspFormatting", function()
                            -- or vim.lsp.buf.formatting(bufnr) on 0.8
                            vim.lsp.buf.format({ bufnr = bufnr })
                        end, {})

                        -- you can leave this out if your on_attach is unique to null-ls,
                        -- but if you share it with multiple servers, you'll want to keep it
                        vim.api.nvim_clear_autocmds({
                            group = augroup,
                            buffer = bufnr,
                        })

                        vim.api.nvim_create_autocmd("BufWritePre", {
                            group = augroup,
                            buffer = bufnr,
                            command = "undojoin | LspFormatting",
                        })
                    end
                end,
                },

                vim.api.nvim_create_user_command(
                  'DisableLspFormatting',
                  function()
                    vim.api.nvim_clear_autocmds({ group = augroup, buffer = 0 })
                  end,
                  { nargs = 0 }
                )
            )
        end,
    },
}
