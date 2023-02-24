local opts = { noremap = true, silent = true }

-- Map leader to space
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', opts)
vim.g.mapleader = " "

-- Tabs
vim.keymap.set('n', 'te', [[<Cmd>tabedit<CR>]])
vim.keymap.set('n', '<S-Tab>', [[<Cmd>tabprev<CR>]])
vim.keymap.set('n', '<Tab>', [[<Cmd>tabnext<CR>]])

-- Select all
vim.keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Clear search highlighting
vim.keymap.set('n', 'cs', [[<Cmd>nohl<CR>]])
