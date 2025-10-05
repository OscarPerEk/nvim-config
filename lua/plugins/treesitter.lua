return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
	opts = {
		ensure_installed = { "go", "lua", "vim", "bash", "json", "yaml", "python" },
		highlight = { enable = true },
		indent = { enable = true },
		incremental_selection = { enable = true },
	},
}
