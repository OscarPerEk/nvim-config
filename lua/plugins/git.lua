return {
	"lewis6991/gitsigns.nvim",
	config = function()
		-- Define highlights properly
		vim.api.nvim_set_hl(0, "GitSignsAdd", { link = "DiffAdd" })
		vim.api.nvim_set_hl(0, "GitSignsChange", { link = "DiffChange" })
		vim.api.nvim_set_hl(0, "GitSignsDelete", { link = "DiffDelete" })

		require("gitsigns").setup({
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "-" },
			},
		})
	end,
}
