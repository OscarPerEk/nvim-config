return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" }, -- Required dependency
		config = function()
			local telescope = require("telescope")
			local builtin = require("telescope.builtin")

			telescope.setup({
				defaults = {
					layout_strategy = "horizontal",
					layout_config = { preview_width = 0.5 },
					sorting_strategy = "ascending",
					mappings = {
						i = { ["<C-u>"] = false, ["<C-d>"] = false }, -- Optional mappings
					},
				},
			})

			-- Keymaps
			vim.keymap.set("n", "<leader>fj", builtin.find_files, { desc = "Search Files" })
			vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Search Diagnostics" })
			vim.keymap.set("n", "<leader>fk", builtin.live_grep, { desc = "Search in Files" })
			vim.keymap.set("n", "<leader>fl", builtin.resume, { desc = "Telescope resume" })
			vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "Telescope resume" })
			vim.keymap.set("n", "<leader>fh", builtin.buffers, { desc = "Telescope buffers" })

			-- Grep word under cursor
			vim.keymap.set("n", "<leader>w", function()
				require("telescope.builtin").grep_string({ search = vim.fn.expand("<cword>") })
			end, { desc = "Search current word in project" })

			-- Search word under cursor
			vim.keymap.set("n", "<leader>o", function()
				local word = vim.fn.expand("<cword>")
				require("telescope.builtin").find_files({ default_text = word })
			end, { noremap = true, silent = true })
		end,
		vim.keymap.set("n", "gj", function()
			require("telescope.builtin").lsp_references({
				include_declaration = false, -- Exclude the definition from the results
			})
		end, { desc = "Go to References with Telescope" }),
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		vim.keymap.set("n", "<space>sg", ":Telescope file_browser<CR>"),
		vim.keymap.set("n", "<space>sf", function()
			require("telescope").extensions.file_browser.file_browser({
				path = "%:p:h", -- current file's directory
				select_buffer = true,
			})
		end),
	},
	{
		"crusj/bookmarks.nvim",
		keys = {
			{ "<leader>dh", desc = "Toggle bookmark window", mode = "n" },
			{ "<leader>dd", desc = "Add bookmark", mode = "n" },
			{ "<leader>ds", desc = "Show bookmark description", mode = "n" },
			{ "<leader>dj", "<cmd>Telescope bookmarks<CR>", desc = "Open bookmarks list", mode = "n" },
		},
		branch = "main",
		dependencies = {
			"nvim-web-devicons",
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			require("bookmarks").setup({
				keymap = {
					toggle = "<leader>dh", -- Toggle bookmark window
					show_desc = "<leader>ds", -- Show description
					add = "<leader>dd",
					-- delete = "something" if you want
				},
			})
			require("telescope").load_extension("bookmarks")
		end,
	},
	{
		"ThePrimeagen/harpoon",
		config = function()
			local harpoon = require("harpoon")
			local mark = require("harpoon.mark")
			local ui = require("harpoon.ui")

			-- Add some keymaps for Harpoon
			vim.api.nvim_set_keymap(
				"n",
				"<leader>df",
				':lua require("harpoon.mark").add_file()<CR>',
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<leader>dk",
				':lua require("harpoon.ui").toggle_quick_menu()<CR>',
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<leader>dn",
				':lua require("harpoon.ui").nav_next()<CR>',
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<leader>dm",
				':lua require("harpoon.ui").nav_prev()<CR>',
				{ noremap = true, silent = true }
			)
		end,
	},
}
