return {
	"nvim-treesitter/nvim-treesitter-context",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		require("treesitter-context").setup({
			enable = true, -- Enable context
			max_lines = 3, -- Number of lines to show (adjust as needed)
			trim_scope = "outer", -- Hide when too much nesting
			mode = "cursor", -- Show context based on cursor position
		})
	end,
}
