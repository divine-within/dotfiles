return {
    -- Comment plugin
    {
        "numToStr/Comment.nvim",
        config = function(_, opts)
            require("Comment").setup(opts)

            local ft = require("Comment.ft")

            -- Python
            ft.set("python", { "#%s", '"""%s"""' })
        end,
        opts = {
            padding = true,
            sticky = true,
            ignore = nil,
            toggler = {
                line = "<leader>cl",
                block = "<leader>cb",
            },
            opleader = {
                -- VISUAL MODE
                line = "<leader>cl",
                block = "<leader>cb",
            },
            extra = {
                ---Add comment on the line above
                above = "<leader>cla",
                ---Add comment on the line below
                below = "<leader>clb",
                ---Add comment at the end of line
                eol = "<leader>cle",
            },
        },
    },

    -- Git management
    "tpope/vim-fugitive",

    -- Markdown preview
    { "iamcco/markdown-preview.nvim", build = "cd app && yarn install" },
}
