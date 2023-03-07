return {
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "saadparwaiz1/cmp_luasnip" },
		version = "v1.*",
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
			vim.keymap.set("i", "<c-j>", function()
				if ls.expand_or_locally_jumpable() then
					ls.expand_or_jump()
				end
			end)

			-- Jump to the previous item
			vim.keymap.set("i", "<c-k>", function()
				if ls.jumpable(-1) then
					ls.jump(-1)
				end
			end)

			-- Scroll forward in a list of choices
			vim.keymap.set("i", "<c-l>", function()
				if ls.choice_active() then
					ls.change_choice(1)
				end
			end)

			-- Scroll backwards in a list of choices
			vim.keymap.set("i", "<c-h>", function()
				if ls.choice_active() then
					ls.change_choice(-1)
				end
			end)

			function load_snippets()
				require("luasnip.loaders.from_lua").load({ paths = vim.fn.stdpath("config") .. "/lua/snippets" })
			end

			-- Initial call
			load_snippets()

			-- Resource snippets
			vim.keymap.set("n", "<leader><leader>s", function()
				load_snippets()
			end)
		end,
	},
}
