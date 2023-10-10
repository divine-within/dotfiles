return {
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "saadparwaiz1/cmp_luasnip" },
		version = "v2.*",
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
		config = function()
			local ls = require("luasnip")
			local types = require("luasnip.util.types")

			ls.setup({
				history = true,
				updateevents = "TextChanged, TextChangedI",
				autosnippets = true,
				ext_opts = {
					[types.choiceNode] = {
						active = {
							virt_text = { { "", "Info" } },
						},
					},
				},
			})

			-- Jump to the next item
			vim.keymap.set({ "i", "s" }, "<A-j>", function()
				if ls.expand_or_locally_jumpable() then
					ls.expand_or_jump()
				end
			end, { desc = "LuaSnip: Jump next or expand", remap = true })

			-- Jump to the previous item
			vim.keymap.set({ "i", "s" }, "<A-k>", function()
				if ls.jumpable(-1) then
					ls.jump(-1)
				end
			end, { desc = "LuaSnip: Jump back", remap = true })

			-- Scroll forward in a list of choices
			vim.keymap.set({ "i", "s" }, "<A-l>", function()
				if ls.choice_active() then
					ls.change_choice(1)
				end
			end, { desc = "LuaSnip list: Scroll forward" })

			-- Scroll backwards in a list of choices
			vim.keymap.set({ "i", "s" }, "<A-h>", function()
				if ls.choice_active() then
					ls.change_choice(-1)
				end
			end, { desc = "LuaSnip list: Scroll backwards" })

			function load_snippets()
				require("luasnip.loaders.from_lua").load({ paths = vim.fn.stdpath("config") .. "/lua/snippets" })
			end

			-- Initial call
			load_snippets()

			-- Resource snippets
			vim.keymap.set("n", "<leader><leader>s", function()
				load_snippets()
			end, { desc = "LuaSnip: Resource snippets" })
		end,
	},
}
