-- Colorscheme settings
vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = {
        "*",
    },
    callback = function()
        vim.cmd("highlight BufDimText guibg='NONE' guifg=darkgrey guisp=darkgrey gui='NONE'")
    end,
})

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
    pattern = "*",
    command = "set nopaste",
})

-- Treesitteer folding workaround
vim.api.nvim_create_autocmd({ "BufEnter", "BufAdd", "BufNew", "BufNewFile", "BufWinEnter" }, {
    group = vim.api.nvim_create_augroup("TS_FOLD_WORKAROUND", {}),
    callback = function()
        vim.opt.foldmethod = "expr"
        vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
    end,
})
