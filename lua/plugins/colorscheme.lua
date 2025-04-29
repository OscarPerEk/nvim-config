-- return {
--   "catppuccin/nvim",
--   name = "catppuccin",
--   priority = 1000, -- Ensures it loads first
--   config = function()
--     vim.cmd("colorscheme catppuccin")
--   end,
-- }

-- return {
--   "rebelot/kanagawa.nvim",
--   config = function()
--     require("kanagawa").setup({
--       theme = "wave", -- Options: wave (default), dragon (darker), lotus (light)
--     })
--     vim.cmd("colorscheme kanagawa")
--   end,
-- }

-- Colorscheme that changeges with time:
-- return {
-- 	"rebelot/kanagawa.nvim",
-- 	config = function()
-- 		local hour = tonumber(os.date("%H"))
-- 		local theme
--
-- 		if hour >= 7 and hour < 13 then
-- 			theme = "lotus" -- Brightest (Morning)
-- 		elseif hour >= 13 and hour < 19 then
-- 			theme = "wave" -- Medium contrast (Afternoon)
-- 		else
-- 			theme = "dragon" -- Darkest (Night)
-- 		end
--
-- 		require("kanagawa").setup({ theme = theme })
-- 		vim.cmd("colorscheme kanagawa")
-- 	end,
-- }

-- dark
return {
	{
		"rebelot/kanagawa.nvim",
		config = function()
			vim.cmd("colorscheme kanagawa-wave") -- Use "kanagawa-wave" or "kanagawa-dragon" if preferred
		end,
	},
}

-- return {
-- 	{
-- 		"catppuccin/nvim",
-- 		name = "catppuccin",
-- 		config = function()
-- 			require("catppuccin").setup({
-- 				flavour = "latte", -- Use the light theme
-- 			})
-- 			vim.cmd("colorscheme catppuccin-latte") -- Apply the light theme
-- 		end,
-- 	},
-- }

-- yellow light
-- return {
-- 	{
-- 		"ellisonleao/gruvbox.nvim",
-- 		config = function()
-- 			vim.cmd("colorscheme gruvbox")
-- 			vim.o.background = "light" -- or "light" for light mode
-- 		end,
-- 	},
-- }

-- return {
-- 	"folke/tokyonight.nvim",
-- 	config = function()
-- 		vim.cmd("colorscheme tokyonight-day") -- or "tokyonight-light"
-- 	end,
-- }
