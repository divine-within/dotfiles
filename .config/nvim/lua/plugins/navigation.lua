return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("neo-tree").setup({
				enable_diagnostics = false,
				enable_git_status = true,
				window = {
					width = 30,
				},
				filesystem = {
					filtered_items = {
						hide_dotfiles = false,
						hide_gitignored = true,
						hide_by_name = {
							".git",
							"node_modules",
						},
					},
					hijack_netrw_behavior = "open_current",
				},
				default_component_configs = {
					icon = {
						folder_closed = "",
						folder_open = "",
					},
					modified = {
						symbol = "",
						highlight = "NeoTreeModified",
					},
				},
			})

			vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

			vim.keymap.set("n", "<leader><Tab>", "<Cmd>Neotree toggle<CR>", { desc = "Neotree: Toggle" })
			vim.keymap.set(
				"n",
				"gp",
				"<Cmd>Neotree reveal_force_cwd<CR>",
				{ desc = "Neotree: Change working directory to current file location" }
			)

			-- Remap :Ex, :Sex to Neotree
			vim.cmd(":command! Ex Neotree toggle current reveal_force_cwd")
			vim.cmd(":command! Sex sp | Neotree toggle current reveal_force_cwd")
		end,
	},

	{
		"mbbill/undotree",
		config = function()
			vim.keymap.set("n", "<leader>ut", "<Cmd>UndotreeToggle<CR>", { desc = "Undotree: Toggle" })
		end,
	},
	"christoomey/vim-tmux-navigator",
}
