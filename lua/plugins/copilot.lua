-- return {
-- 	"github/copilot.vim",
-- 	event = "InsertEnter",
-- 	config = function()
-- 		-- Map <leader>ai to enable Copilot
-- 		vim.api.nvim_set_keymap("n", "<leader>ai", ":Copilot enable<CR>", { noremap = true, silent = true })
--
-- 		-- Map <leader>ao to disable Copilot
-- 		vim.api.nvim_set_keymap("n", "<leader>ao", ":Copilot disable<CR>", { noremap = true, silent = true })
--
-- 		-- Dismiss Copilot suggestion
-- 		vim.api.nvim_set_keymap("i", "<leader>aj", "<C-E>", { noremap = true, silent = true })
--
-- 		-- Toggle Copilot
-- 		vim.api.nvim_set_keymap("n", "<C-3>", ":Copilot toggle<CR>", { noremap = true, silent = true })
-- 	end,
-- }
--
--
return {
	"zbirenbaum/copilot.lua",
	dependencies = { "zbirenbaum/copilot-cmp" }, -- Ensure copilot-cmp is installed
	config = function()
		-- Set up copilot.lua with suggestions enabled
		require("copilot").setup({
			suggestion = { enabled = false }, -- Disable inline suggestions (handled by cmp)
			panel = { enabled = false }, -- Disable Copilot panel
		})

		-- Enable Copilot
		vim.api.nvim_set_keymap("n", "<leader>ai", ":Copilot enable<CR>", { noremap = true, silent = true })

		-- Disable Copilot
		vim.api.nvim_set_keymap("n", "<leader>ao", ":Copilot disable<CR>", { noremap = true, silent = true })

		-- Set up Copilot for nvim-cmp
		require("copilot_cmp").setup() -- This connects Copilot to cmp

		-- Configure nvim-cmp
		local cmp = require("cmp")

		cmp.setup({
			sources = {
				{ name = "copilot", group_index = 2 }, -- Ensure Copilot has higher priority
				{ name = "nvim_lsp" },
				{ name = "buffer" },
			},
		})
	end,
}
