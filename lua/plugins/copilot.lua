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
	dependencies = { "zbirenbaum/copilot-cmp" },
	config = function()
		require("copilot").setup({
			suggestion = { enabled = false },
			panel = { enabled = false },
		})
		require("copilot_cmp").setup()
	end,
}
