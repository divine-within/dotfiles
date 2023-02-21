return {
    { "catppuccin/nvim",
        name = "catppuccin",
        config = function()
            require('catppuccin').setup({
                flavour = "mocha", -- latte, frappe, macchiato, mocha
                background = { -- :h background
                    light = "latte",
                    dark = "mocha",
                },
                term_colors = true,
                transparent_background = true,
                compile_path = vim.fn.stdpath "cache" .. "/catppuccin",
                no_italic = true,
                styles = {
                    comments = {},
                    conditionals = {},
                    loops = {},
                    functions = {},
                    keywords = {},
                    strings = {},
                    variables = {},
                    numbers = {},
                    booleans = {},
                    properties = {},
                    types = {},
                },
                color_overrides = {
                    latte = {
                        base = "#E1EEF5",
                    },
                    mocha = {
                        base = "#000000",
                    },
                },
                highlight_overrides = {
                    latte = function(latte)
                        return {
                            NvimTreeNormal = { bg = "#D1E5F0" },
                        }
                    end,
                    mocha = function(mocha)
                        return {
                            NvimTreeNormal = { bg = mocha.none },
                            CmpBorder = { fg = mocha.surface2 },
                        }
                    end,
                },
                integrations = {
                    cmp = true,
                    gitsigns = true,
                    neotree = true,
                    telescope = true,
                    treesitter = true,
                    mason = true,
                    navic = {
                        enabled = true,
                        custom_bg = "NONE"
                    },
                    native_lsp = {
                        enabled = true,
                        virtual_text = {
                            errors = { "italic" },
                            hints = { "italic" },
                            warnings = { "italic" },
                            information = { "italic" },
                        },
                        underlines = {
                            errors = { "underline" },
                            hints = { "underline" },
                            warnings = { "underline" },
                            information = { "underline" },
                        },
                    },
                    dap = {
                        enabled = true,
                        enable_ui = true, -- enable nvim-dap-ui
                    },
                    -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
                },
            })

            vim.cmd [[colorscheme catppuccin]]
        end,
    },
}
