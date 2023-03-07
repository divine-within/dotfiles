--[[
To see what an option is set to execute :lua = vim.o.<name>
--]]

vim.opt.list = true
vim.opt.listchars:append "space:⋅"

vim.o.backup = false
vim.o.swapfile = false
vim.o.undodir = vim.fn.stdpath('config') .. "/undodir"
vim.o.undofile = true

vim.o.hlsearch = false
vim.o.incsearch = true

vim.o.scrolloff = 8

vim.o.updatetime = 50 -- affects CursorHold and subsequently things like highlighting Code Actions, and the Noice UI popups.

vim.o.background = "dark"
vim.o.clipboard = "unnamedplus"
vim.o.completeopt = "menuone,noinsert,noselect"
vim.o.cursorline = true
vim.o.dictionary = "/usr/share/dict/words"

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.smartindent = true

--vim.g.mapleader = ' '

vim.o.grepprg = "rg --vimgrep"
vim.o.ignorecase = true
vim.o.inccommand = "split"
-- vim.o.lazyredraw = true (disabled as problematic with Noice plugin)
vim.o.number = true
vim.o.relativenumber = true
-- vim.o.shortmess = vim.o.shortmess .. "c" -- .. is equivalent to += in vimscript
vim.o.shortmess = "filnxToOFc" -- copied default and removed `t` (long paths were being truncated) while adding `c`
vim.o.showmatch = true
vim.o.signcolumn = "auto"
vim.o.smartcase = true
vim.o.splitbelow = 50
vim.o.splitright = true
vim.o.wrap = false
vim.o.mouse = false

-- Treesitter folding
vim.o.foldlevel = 3

if vim.fn.has("termguicolors") == 1 then
    vim.o.termguicolors = true --termgui colors
end

--[[
vim.o allows you to set global vim options, but not local buffer vim options.
vim.opt has a more expansive API that can handle local and global vim options.
See :h lua-vim-options
]]
vim.opt.colorcolumn = "80"
