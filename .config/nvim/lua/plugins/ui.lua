return {
    -- status line
    {
        "feline-nvim/feline.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
        config = function()
            local clrs = require("catppuccin.palettes").get_palette()
            local ctp_feline = require("catppuccin.groups.integrations.feline")
            local U = require("catppuccin.utils.colors")
            local latte = require("catppuccin.palettes").get_palette("latte")
            --[[
			local ok, icons = pcall(require, "utils.icons")

			if not ok then
				print("Icons couldn't be loaded.")
			end
            --]]
            ctp_feline.setup({
                assets = {
                    left_separator = "",
                    right_separator = "",
                    mode_icon = "",
                    dir = "󰉖",
                    file = "󰈙",
                    lsp = {
                        server = "󰅡",
                        error = "",
                        warning = "",
                        info = "",
                        hint = "",
                    },
                    git = {
                        branch = "",
                        added = "",
                        changed = "",
                        removed = "",
                    },
                },
                sett = {
                    text = U.vary_color({ latte = latte.base }, clrs.surface0),
                    bkg = U.vary_color({ latte = latte.crust }, clrs.surface0),
                    diffs = clrs.mauve,
                    extras = clrs.overlay1,
                    curr_file = clrs.maroon,
                    curr_dir = clrs.flamingo,
                    show_modified = true, -- show if the file has been modified
                },
                mode_colors = {
                        ["n"] = { "NORMAL", clrs.lavender },
                        ["no"] = { "N-PENDING", clrs.lavender },
                        ["i"] = { "INSERT", clrs.green },
                        ["ic"] = { "INSERT", clrs.green },
                        ["t"] = { "TERMINAL", clrs.green },
                        ["v"] = { "VISUAL", clrs.flamingo },
                        ["V"] = { "V-LINE", clrs.flamingo },
                        ["�"] = { "V-BLOCK", clrs.flamingo },
                        ["R"] = { "REPLACE", clrs.maroon },
                        ["Rv"] = { "V-REPLACE", clrs.maroon },
                        ["s"] = { "SELECT", clrs.maroon },
                        ["S"] = { "S-LINE", clrs.maroon },
                        ["�"] = { "S-BLOCK", clrs.maroon },
                        ["c"] = { "COMMAND", clrs.peach },
                        ["cv"] = { "COMMAND", clrs.peach },
                        ["ce"] = { "COMMAND", clrs.peach },
                        ["r"] = { "PROMPT", clrs.teal },
                        ["rm"] = { "MORE", clrs.teal },
                        ["r?"] = { "CONFIRM", clrs.mauve },
                        ["!"] = { "SHELL", clrs.green },
                },
            })

            require("feline").setup({
                components = ctp_feline.get(),
            })
        end,
    },

    -- ui improvements
    {
        "stevearc/dressing.nvim",
        config = true,
    },

    -- Hex code colorizer
    {
        "NvChad/nvim-colorizer.lua",
        config = true,
    },

    -- tab ui improvments
    {
        "akinsho/bufferline.nvim",
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
                        separator = true, -- use a "true" to enable the default, or set your own character
                    },
                },
                show_buffer_close_icons = false,
                show_close_icon = false,
                separator_style = "none",
                always_show_bufferline = true,
                enforce_regular_tabs = true,
                highlights = require("catppuccin.groups.integrations.bufferline").get(),
            },
        },
    },

    -- quickfix improvements
    --
    -- <Tab> to select items.
    -- zn to keep selected items.
    -- zN to filter selected items.
    -- zf to fuzzy search items.
    {
        "junegunn/fzf",
        build = function()
            vim.fn["fzf#install"]()
        end,
    },

    { "kevinhwang91/nvim-bqf", ft = "qf" },

    -- window bar breadcrumbs
    {
        "SmiteshP/nvim-navic",
        --dependencies = "neovim/nvim-lspconfig",
        lazy = true,
        opts = {
            highlight = true,
        },
    },

    -- Debugging
    {
        "rcarriga/nvim-dap-ui",
        lazy = true,
        config = function(_, opts)
            require("dapui").setup(opts)
        end,
        opts = {
            layouts = {
                {
                    elements = {
                        -- Provide as ID strings or tables with "id" and "size" keys
                        {
                            id = "scopes",
                            size = 0.25, -- Can be float or integer > 1
                        },
                        { id = "breakpoints", size = 0.25 },
                        { id = "stacks",      size = 0.25 },
                        { id = "watches",     size = 0.25 },
                    },
                    size = 40,
                    position = "left",
                },
                { elements = { "repl" }, size = 10, position = "bottom" },
            },
            controls = {
                enabled = true,
                -- Display controls in this session
                element = "repl",
                icons = {
                    pause = "",
                    play = "",
                    run_last = "↻",
                    step_back = "",
                    step_into = "",
                    step_out = "",
                    step_over = "",
                    terminate = "ﱢ",
                },
            },
        },
    },

    {
        "simrat39/symbols-outline.nvim",
        config = function(_, opts)
            require("symbols-outline").setup(opts)
            vim.keymap.set("n", "<leader>so", "<cmd>SymbolsOutline<CR>", { desc = "SymbolsOutline: Toggle" })
        end,
        opts = {
            highlight_hovered_item = true,
            show_guides = true,
            auto_preview = false,
            position = "right",
            relative_width = true,
            width = 25,
            auto_close = false,
            show_numbers = false,
            show_relative_numbers = false,
            show_symbol_details = true,
            preview_bg_highlight = "Pmenu",
            autofold_depth = nil,
            auto_unfold_hover = true,
            fold_markers = { "", "" },
            wrap = false,
            keymaps = {
                -- These keymaps can be a string or a table for multiple keys
                close = { "<Esc>", "q" },
                goto_location = "<Cr>",
                focus_location = "o",
                hover_symbol = "<C-space>",
                toggle_preview = "K",
                rename_symbol = "r",
                code_actions = "a",
                fold = "e",
                unfold = "e",
                fold_all = "W",
                unfold_all = "E",
                fold_reset = "R",
            },
            lsp_blacklist = {},
            symbol_blacklist = {},
            symbols = {
                File = { icon = "󰈙", hl = "@text.uri" },
                Module = { icon = "", hl = "@namespace" },
                Namespace = { icon = "󰅪", hl = "@namespace" },
                Package = { icon = "", hl = "@namespace" },
                Class = { icon = "𝓒", hl = "@type" },
                Method = { icon = "ƒ", hl = "@method" },
                Property = { icon = "", hl = "@method" },
                Field = { icon = "󰜢", hl = "@field" },
                Constructor = { icon = "", hl = "@constructor" },
                Enum = { icon = "ℰ", hl = "@type" },
                Interface = { icon = "", hl = "@type" },
                Function = { icon = "󰊕", hl = "@function" },
                Variable = { icon = "", hl = "@constant" },
                Constant = { icon = "", hl = "@constant" },
                String = { icon = "", hl = "@string" },
                Number = { icon = "󰎠", hl = "@number" },
                Boolean = { icon = "⊨", hl = "@boolean" },
                Array = { icon = "󰅪", hl = "@constant" },
                Object = { icon = "⦿", hl = "@type" },
                Key = { icon = "󰌋", hl = "@type" },
                Null = { icon = "NULL", hl = "@type" },
                EnumMember = { icon = "", hl = "@field" },
                Struct = { icon = "𝓢", hl = "@type" },
                Event = { icon = "🗲", hl = "@type" },
                Operator = { icon = "󱓉", hl = "@operator" },
                TypeParameter = { icon = "𝙏", hl = "@parameter" },
                Component = { icon = "", hl = "@function" },
                Fragment = { icon = "", hl = "@constant" },
            },
        },
    },
    -- Git
    {
        "lewis6991/gitsigns.nvim",
        lazy = true,
        event = { "CursorHold", "CursorHoldI" },
        opts = {
            signs = {
                add = { text = "│" },
                change = { text = "│" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
                untracked = { text = "┆" },
            },
            signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
            numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
            linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
            word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
            watch_gitdir = {
                interval = 1000,
                follow_files = true,
            },
            attach_to_untracked = true,
            current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
                delay = 1000,
                ignore_whitespace = false,
            },
            current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
            sign_priority = 6,
            update_debounce = 100,
            status_formatter = nil, -- Use default
            max_file_length = 40000, -- Disable if file is longer than this (in lines)
            preview_config = {
                -- Options passed to nvim_open_win
                border = "single",
                style = "minimal",
                relative = "cursor",
                row = 0,
                col = 1,
            },
            yadm = {
                enable = false,
            },
        },
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
    },
    {
        "folke/zen-mode.nvim",
        opts = {},
    },
}
