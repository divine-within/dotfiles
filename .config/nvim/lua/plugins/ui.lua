return {
    -- status line
    { "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
        opts = {
            options = {
                theme = "catppuccin"
            },
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
                mode = "tabs",
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
                highlights = require("catppuccin.groups.integrations.bufferline").get()
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

    -- Git
    { "lewis6991/gitsigns.nvim",
        opts = {
              signs = {
                add          = { text = '│' },
                change       = { text = '│' },
                delete       = { text = '_' },
                topdelete    = { text = '‾' },
                changedelete = { text = '~' },
                untracked    = { text = '┆' },
              },
              signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
              numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
              linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
              word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
              watch_gitdir = {
                interval = 1000,
                follow_files = true
              },
              attach_to_untracked = true,
              current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
              current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                delay = 1000,
                ignore_whitespace = false,
              },
              current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
              sign_priority = 6,
              update_debounce = 100,
              status_formatter = nil, -- Use default
              max_file_length = 40000, -- Disable if file is longer than this (in lines)
              preview_config = {
                -- Options passed to nvim_open_win
                border = 'single',
                style = 'minimal',
                relative = 'cursor',
                row = 0,
                col = 1
              },
              yadm = {
                enable = false
              },
            }
    },

    { "lukas-reineke/indent-blankline.nvim",
        opts = {
            indent_blankline_use_treesitter = true,
            show_end_of_line = false,
            show_current_context = true,
        }
    },
}
