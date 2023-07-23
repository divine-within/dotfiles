return {
	{
		"onsails/lspkind-nvim",
		config = function()
			local lspkind = require("lspkind")

			lspkind.init({
				mode = "symbol_text",
				preset = "codicons",
				symbol_map = {
					Text = "",
					Method = "󰆧",
					Function = "󰊕",
					Constructor = "",
					Field = "󰜢",
					Variable = "",
					Class = "󰠱",
					Interface = "",
					Module = "",
					Property = "",
					Unit = "",
					Value = "󰎠",
					Enum = "ℰ",
					Keyword = "󰌋",
					Snippet = "",
					Color = "󱥚",
					File = "󰈙",
					Reference = "",
					Folder = "󰉋",
					EnumMember = "",
					Constant = "",
					Struct = "𝓢",
					Event = "",
					Operator = "󱓉",
					TypeParameter = "",
				},
			})
		end,
	},

	{
		"hrsh7th/nvim-cmp",
		dependencies = { "onsails/lspkind-nvim", "L3MON4D3/LuaSnip" },
		config = function()
			local cmp = require("cmp")
			local lspkind = require("lspkind")
			local luasnip = require("luasnip")

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = {
					["<Up>"] = cmp.mapping.select_prev_item(),
					["<Down>"] = cmp.mapping.select_next_item(),
					["<Left>"] = cmp.mapping.select_prev_item(),
					["<Right>"] = cmp.mapping.select_next_item(),
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
					["<C-e>"] = cmp.mapping.close(),
					["<CR>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Insert,
						select = true,
					}),
				},
				sources = cmp.config.sources({
					-- ordered by priority
					{ name = "nvim_lsp" },
					{ name = "nvim_lsp_signature_help" },
					{ name = "path" },
					{ name = "buffer" },
					{ name = "luasnip" },
					{ name = "nvim_lua" },
				}),
				formatting = {
					format = lspkind.cmp_format({ wirth_text = false, maxwidth = 50 }),
				},
			})

			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			cmp.setup.cmdline({ ":" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "cmdline" },
					{ name = "path" },
				},
			})
		end,
	},

	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/cmp-nvim-lua",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lsp-signature-help",
	"hrsh7th/cmp-path",
}
