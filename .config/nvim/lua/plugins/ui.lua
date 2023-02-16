return {
    -- status line
    { "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
        opts = {
            sections = {
                lualine_c = {
                    {
                        "filename",
                        file_status = true, -- displays file status (readonly status, modified status)
                        path = 1, -- relative path
                        shorting_target = 40 -- Shortens path to leave 40 space in the window
                    },
                },
            }
        }
    },

    -- ui improvements
    {
        "stevearc/dressing.nvim",
        config = true,
    },

    -- tab ui improvments
    { "akinsho/bufferline.nvim",
        version = "v3.*",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            options = {
                mode = "buffers",
                indicator = { style = "underline" },
                tab_size = 15,
                offsets = {
                    {
                        filetype = "Neotree",
                        text = "File Explorer",
                        highlight = "Directory",
                        separator = true -- use a "true" to enable the default, or set your own character
                    }
                },
                show_buffer_close_icons = false,
                show_close_icon = false,
                separator_style = "none",
                always_show_bufferline = true,
                enforce_regular_tabs = true,
            }
        },
    },

    -- quickfix improvements
    --
    -- <Tab> to select items.
    -- zn to keep selected items.
    -- zN to filter selected items.
    -- zf to fuzzy search items.
    { "junegunn/fzf",
        build = function()
            vim.fn["fzf#install"]()
        end
    },

    { "kevinhwang91/nvim-bqf", ft = "qf" },

    -- window bar breadcrumbs
    {
        "SmiteshP/nvim-navic",
        dependencies = "neovim/nvim-lspconfig",
        opts = {
            highlight = true,
        }
    },

    -- Debugging
    { "rcarriga/nvim-dap-ui",
        lazy = true,
        dependencies = { "mfussenegger/nvim-dap" },
        config = true,
    },
}
