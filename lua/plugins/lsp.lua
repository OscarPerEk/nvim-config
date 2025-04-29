return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "williamboman/mason.nvim" },
		opts = {
			settings = {
				separate_diagnostic_server = true,
				publish_diagnostic_on = "insert_leave",
				expose_as_code_action = "all",
				tsserver_plugins = {},
				tsserver_file_preferences = {
					includeInlayParameterNameHints = "all",
					includeCompletionsForModuleExports = true,
					quotePreference = "auto",
				},
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			local lspconfig = require("lspconfig")

			-- Setup gopls
			lspconfig.gopls.setup({
				cmd = { "gopls" },
				settings = {
					gopls = {
						analyses = {
							unusedparams = true,
						},
						staticcheck = true,
					},
				},
			})

			-- Keybindings for LSP actions
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
			vim.keymap.set("n", "<leader>n", vim.lsp.buf.rename, { desc = "Rename Symbol" })
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })

			-- Go to commands
			-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
			vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Go to References" })
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to Implementation" })
			vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { desc = "Go to Type Definition" }) -- delete?
			vim.keymap.set("n", "gk", vim.lsp.buf.type_definition, { desc = "Go to Type Definition" })

			-- Information and diagnostics
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
			vim.keymap.set("n", "<leader>sh", vim.lsp.buf.signature_help, { desc = "Signature Help" })
			vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show Diagnostics" })
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous Diagnostic" })

			-- Editing and refactoring
			-- vim.keymap.set("n", "<leader>n", vim.lsp.buf.rename, { desc = "Rename Symbol" })
			-- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
			-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format Buffer" })
		end,
	},
}
