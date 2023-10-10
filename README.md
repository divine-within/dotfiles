# DivineWithin's dotfiles

These are my personal dotfiles which I've configured for an efficient workflow.

## Neovim

### Plugins

#### Functional

- [folke/lazy.nvim](https://github.com/folke/lazy.nvim) - A modern plugin manager for Neovim
- [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - A collection of configurations for Neovim's built-in LSP
- [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim) - Portable package manager for Neovim that runs everywhere Neovim runs. Easily install and manage LSP servers, DAP servers, linters, and formatters
- [williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) - Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim
- [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - A completion engine plugin for neovim written in Lua
- [hrsh7th/cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) - nvim-cmp source for neovim's built-in LSP
- [hrsh7th/cmp-buffer](https://github.com/hrsh7th/cmp-buffer) - nvim-cmp source for buffer words
- [hrsh7th/cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline) - nvim-cmp source for neovim's cmdline
- [hrsh7th/cmp-nvim-lua](https://github.com/hrsh7th/cmp-nvim-lua) - nvim-cmp source for neovim's Lua API
- [hrsh7th/cmp-path](https://github.com/hrsh7th/cmp-path) - nvim-cmp source for filesystem paths
- [saadparwaiz1/cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip) - Luasnip completion source for nvim-cmp
- [L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip) - Snippet Engine for Neovim written in Lua
- [onsails/lspkind-nvim](https://github.com/onsails/lspkind-nvim) - VSCode-like pictograms
- [glepnir/lspsaga.nvim](https://github.com/glepnir/lspsaga.nvim) - A light-weight LSP plugin based on neovim's built-in LSP with a highly performant UI
- [lvimuser/lsp-inlayhints.nvim](https://github.com/lvimuser/lsp-inlayhints.nvim) - Partial implementation of LSP inlay hints
- [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - [Treesitter](https://github.com/tree-sitter/tree-sitter) configurations and abstraction layer for Neovim
- [jose-elias-alvarez/null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim) - Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
- [mfussenegger/nvim-dap](https://github.com/mfussenegger/nvim-dap) - Debug Adapter Protocol client implementation for Neovim
- [leoluz/nvim-dap-go](https://github.com/leoluz/nvim-dap-go) - An extension for nvim-dap providing configurations for launching go debugger (delve)
- [mfussenegger/nvim-dap-python](https://github.com/mfussenegger/nvim-dap-python) - An extension for nvim-dap providing default configurations for python and methods to debug individual test methods or classes
- [rcarriga/nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) - A UI for nvim-dap with good out of the box configuration
- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - A highly extendable fuzzy finder over lists
- [nvim-pack/nvim-spectre](https://github.com/nvim-pack/nvim-spectre) - A search panel for neovim
- [junegunn/fzf](https://github.com/junegunn/fzf.vim) - Wrapper for fzf
- [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive) - Git integration for Vim
- [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) - Git integration for buffers
- [mbbill/undotree](https://github.com/mbbill/undotree) - Visualization of the undo history
- [nvim-neo-tree/neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) - Neovim plugin to browse the file system and other tree like structures
- [simrat39/symbols-outline.nvim](https://github.com/simrat39/symbols-outline.nvim) - A tree like view for symbols in Neovim using LSP
- [numToStr/Comment.nvim](https://github.com/numToStr/Comment.nvim) - Smart and Powerful commenting plugin for Neovim
- [haya14busa/vim-asterisk](https://github.com/haya14busa/vim-asterisk) - Improved \* motions
- [iamcco/markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim) - Markdown live preview
- [christoomey/vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) - Navigation within Tmux & Neovim
- [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim) - Useful Lua functions

#### More visual

- [catppuccin/nvim](https://github.com/catppuccin/nvim) - 🍨 Soothing pastel theme for (Neo)vim
- [akinsho/nvim-bufferline.lua](https://github.com/akinsho/nvim-bufferline.lua) - A snazzy bufferline
- [famiu/feline.nvim](https://github.com/famiu/feline.nvim) - A minimal, stylish and customizable statusline/winbar for Neovim written in Lua
- [stevearc/dressing.nvim](https://github.com/stevearc/dressing.nvim) - Core UI extension
- [jinh0/eyeliner.nvim](https://github.com/jinh0/eyeliner.nvim) - Move faster with unique f/F indicators for each word on the line
- [lukas-reineke/indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) - Indentation guides for Neovim
- [machakann/vim-highlightedyank](https://github.com/machakann/vim-highlightedyank) - Highlight yanked text
- [RRethy/vim-illuminate](https://github.com/RRethy/vim-illuminate) - Automatically highlights other uses of the word under the cursor using either LSP, Tree-sitter, or regex matching
- [folke/todo-comments.nvim](https://github.com/folke/todo-comments.nvim) - Todo comments highlighter
- [DanilaMihailov/beacon.nvim](https://github.com/DanilaMihailov/beacon.nvim) - Cursor jump animation
- [MunifTanjim/nui.nvim](https://github.com/MunifTanjim/nui.nvim) - UI Component Library for Neovim
- [norcalli/nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua) - A high-performance color highlighter
- [kevinhwang91/nvim-hlslens](https://github.com/kevinhwang91/nvim-hlslens) - Matched instances highlighter & helper
- [SmiteshP/nvim-navic](https://github.com/SmiteshP/nvim-navic) - A simple statusline/winbar component that uses LSP
- [nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) - Lua `fork` of [vim-devicons](https://github.com/ryanoasis/vim-devicons) for neovim
- [folke/which-key.nvim](https://github.com/folke/which-key.nvim) - Popup with possible key bindings of the command you started typing
- [folke/zen-mode.nvim](https://github.com/folke/zen-mode.nvim) - Distraction-free mode

### Mappings

```lua
-- NeoTree
-- <leader>Tab - Toggle tree
-- a - Create file/folder (Neotree window)
-- d - Delete file/folder (Neotree window)
-- r - Rename file/folder (Neotree window)
-- . - Make root directory (Neotree window)
-- Backspace - Go up a directory (Neotree window)

-- UndoTree
-- <leader>ut - Toggle undotree

-- Comment
-- <leader>cl - Comment line
-- <leader>cb - Comment block
-- <leader>cla - Comment above
-- <leader>clb - Comment below
-- <leader>cle - Comment at the end of the line

-- LspSaga
-- K - Hover doc, press again to step into
-- Alt-k - Persistent hover doc, press K to step into
-- Alt-t - Toggle floating terminal
-- <leader>r - Rename all occurrences in the buffer
-- <leader>ra - Rename all occurrences in the project
-- <leader>cd - Cursor diagnostics
-- <leader>ld - Line diagnostics
-- <leader>bd - Buffer diagnostics
-- ]e - Jump to next diagnostics (capital E for error)
-- [e - Jump to previous diagnostics (capital E for error)
-- <leader>ca - Code actions
-- <leader>ic - Incoming calls
-- <leader>oc - Outgoing calls
-- <leader>pd - Peek definition
-- Control-c-o - Go to definition (peek window)
-- Control-c-s - Open definition in a vertical split (peek window)
-- Control-c-i - Open definition in a horizontal split (peek window)
-- Control-c-t - Open definition in a new tab (peek window)
-- <leader>gd - Go to definition
-- Control-o - Go back

-- Luasnip
-- Alt-j - Expand, next node
-- Alt-k - Previous node
-- Alt-l - Next choice (if available)
-- Alt-h - Previous choice (if available)
-- <leader><leader>s - Reload snippets

-- DAP
-- <leader>tb - Toggle breakpoint
-- <F5> - Continue
-- <F10> - Step over
-- <F11> - Step into
-- <F12> - Step out
-- <leader>dl - Run last
-- <leader>dr - REPL

-- Telescope
-- <leader>f - Search for files
-- <leader>cf - Search for changed files
-- <leader>w - Search for windows
-- <leader>t - Search for tabs
-- <leader>b - Search for buffers
-- <leader>x - Search for text inside of files
-- <leader>tk - Search for keymaps
-- <leader>th - Search for help pages
-- <leader>te - Search for emojis
-- <leader>td - Search for todos

-- Symbols outline
-- <leader>so - Toggle outline

-- Spectre
-- <leader>S - Search and replace
```
