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

    { "glepnir/lspsaga.nvim",
        lazy = true,
        event = "BufRead",
        config = function()
          require("lspsaga").setup({})

        -- LSP finder - Find the symbol's definition
        -- If there is no definition, it will instead be hidden
        -- When you use an action in finder like "open vsplit",
        -- you can use <C-t> to jump back
        vim.keymap.set("n", "gh", "<cmd>Lspsaga lsp_finder<CR>")

        -- Code action
        vim.keymap.set({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>")

        -- Rename all occurrences of the hovered word for the entire file
        vim.keymap.set("n", "gr", "<cmd>Lspsaga rename<CR>")

        -- Rename all occurrences of the hovered word for the selected files
        vim.keymap.set("n", "gr", "<cmd>Lspsaga rename ++project<CR>")

        -- Peek definition
        -- You can edit the file containing the definition in the floating window
        -- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
        -- It also supports tagstack
        -- Use <C-t> to jump back
        vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>")

        -- Go to definition
        vim.keymap.set("n","gd", "<cmd>Lspsaga goto_definition<CR>")

        -- Peek type definition
        -- You can edit the file containing the type definition in the floating window
        -- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
        -- It also supports tagstack
        -- Use <C-t> to jump back
        vim.keymap.set("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>")

        -- Go to type definition
        vim.keymap.set("n","gt", "<cmd>Lspsaga goto_type_definition<CR>")


        -- Show line diagnostics
        -- You can pass argument ++unfocus to
        -- unfocus the show_line_diagnostics floating window
        vim.keymap.set("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>")

        -- Show cursor diagnostics
        -- Like show_line_diagnostics, it supports passing the ++unfocus argument
        vim.keymap.set("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")

        -- Show buffer diagnostics
        vim.keymap.set("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>")

        -- Diagnostic jump
        -- You can use <C-o> to jump back to your previous location
        vim.keymap.set("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
        vim.keymap.set("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")

        -- Diagnostic jump with filters such as only jumping to an error
        vim.keymap.set("n", "[E", function()
          require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
        end)
        vim.keymap.set("n", "]E", function()
          require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
        end)

        -- Toggle outline
        vim.keymap.set("n","<leader>o", "<cmd>Lspsaga outline<CR>")

        -- Hover Doc
        -- If there is no hover doc,
        -- there will be a notification stating that
        -- there is no information available.
        -- To disable it just use ":Lspsaga hover_doc ++quiet"
        -- Pressing the key twice will enter the hover window
        vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>")

        -- If you want to keep the hover window in the top right hand corner,
        -- you can pass the ++keep argument
        -- Note that if you use hover with ++keep, pressing this key again will
        -- close the hover window. If you want to jump to the hover window
        -- you should use the wincmd command "<C-w>w"
        vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc ++keep<CR>")

        -- Call hierarchy
        vim.keymap.set("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
        vim.keymap.set("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")

        -- Floating terminal
        vim.keymap.set({"n", "t"}, "<A-d>", "<cmd>Lspsaga term_toggle<CR>")
        end,
        dependencies = { {"nvim-tree/nvim-web-devicons"} }
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
                        -- you can leave this out if your on_attach is unique to null-ls,
                        -- but if you share it with multiple servers, you'll want to keep it
                        vim.api.nvim_clear_autocmds({
                            group = augroup,
                            buffer = bufnr,
                        })

                        vim.api.nvim_create_autocmd("BufWritePre", {
                            group = augroup,
                            buffer = bufnr,
                            callback = function()
                                vim.lsp.buf.format({ bufnr = bufnr })
                            end,
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
