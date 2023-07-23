return {
	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = "BufReadPost",
		config = function()
			require("nvim-treesitter.configs").setup({
				-- A list of parser names, or "all"
				ensure_installed = {
					"yaml",
					"javascript",
					"typescript",
					"tsx",
					"json",
					"html",
					"css",
					"python",
					"lua",
					"fish",
					"go",
					"gomod",
					"gowork",
					"dockerfile",
					"markdown",
					"markdown_inline",
				},

				-- Install parsers synchronously (only applied to `ensure_installed`)
				sync_install = false,

				-- Automatically install missing parsers when entering buffer
				-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
				auto_install = true,

				---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
				-- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

				highlight = {
					-- `false` will disable the whole extension
					enable = true,
				},

				-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
				-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
				-- Using this option may slow down your editor, and you may see some duplicate highlights.
				-- Instead of true it can also be a list of languages
				additional_vim_regex_highlighting = false,
			})
		end,
	},

	-- word usage highlighter
	{
		"RRethy/vim-illuminate",
		lazy = true,
		config = function()
			require("illuminate").configure({
				filetypes_denylist = {},
			})
		end,
	},

	-- jump to word indictors
	{
		"jinh0/eyeliner.nvim",
		config = function()
			require("eyeliner").setup({
				highlight_on_key = true,
				dim = true,
			})

			vim.api.nvim_set_hl(0, "EyelinerPrimary", { underline = true })
			vim.api.nvim_create_autocmd("ColorScheme", {
				pattern = {
					"*",
				},
				callback = function()
					vim.api.nvim_set_hl(0, "EyelinerPrimary", { underline = true })
				end,
			})
		end,
	},

	-- cursor movement highlighter
	"DanilaMihailov/beacon.nvim",

	-- highlight yanked region
	"machakann/vim-highlightedyank",

	-- suggest mappings
	{
		"folke/which-key.nvim",
		config = true,
	},
}
