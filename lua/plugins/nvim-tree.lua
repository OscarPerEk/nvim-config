return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("nvim-tree").setup({
			view = {
				width = 60,
				side = "left",
			},
			renderer = {
				icons = {
					show = { file = true, folder = true, folder_arrow = true },
				},
			},
			actions = {
				open_file = {
					quit_on_open = true, -- Auto-close tree after opening a file
				},
			},
		})
		-- Keybinding to toggle NvimTree
		vim.keymap.set("n", "<leader>e", function()
			vim.cmd("NvimTreeToggle")
		end, { silent = true, noremap = true })
		vim.keymap.set("n", "<leader>r", function()
			vim.cmd("NvimTreeFindFile")
		end, { silent = true, noremap = true })
	end,
}
