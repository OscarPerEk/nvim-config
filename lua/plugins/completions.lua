return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
	},
	config = function()
		local cmp = require("cmp")
		cmp.setup({
			mapping = cmp.mapping.preset.insert({
				-- Trigger completion menu
				["<C-2>"] = cmp.mapping.complete(),

				-- Navigate suggestions
				["<C-n>"] = cmp.mapping.select_next_item(),     -- Next suggestion
				["<C-p>"] = cmp.mapping.select_prev_item(),     -- Previous suggestion

				-- Accept suggestion
				["<C-CR>"] = cmp.mapping.confirm({ select = true }),
			}),
			sources = cmp.config.sources({
				{ name = "copilot", group_index = 2 },
				{ name = "nvim_lsp" },
				{ name = "buffer" },
				{ name = "path" },
			}),
		})
	end,
}
