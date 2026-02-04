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

            -- Setup basedpyright
            lspconfig.basedpyright.setup({
				-- Optional: You can add specific settings for basedpyright here.
				-- For example, to control type checking mode or enable specific diagnostics:
				settings = {
				  python = {
				    analysis = {
                        reportUnknownVariableType = "none",  -- this donst seem to work. Instead add rules in poetry toml then it works
                        reportUnknownMemberType = "none",
				    },
				  },
				},
			})


            --- Add the ruff.setup configuration here ---
            lspconfig.ruff.setup({
                -- This is the crucial part for Ruff LSP
                -- Ensure you have `ruff` installed via `:MasonInstall ruff`
                init_options = {
                    settings = {
                        format = {
                            enable = true,
                        },
                        lint = {
                            enable = true,
                        },
                        -- You can also add lineLength here if you want it applied consistently
                        -- lineLength = 88,
                    },
                },
                -- It's good practice to pass capabilities to all LSP setups
                capabilities = capabilities,
                -- If you have a shared on_attach function for common keymaps/autocommands, you can add it here:
                -- on_attach = function(client, bufnr)
                --     -- common keymaps or logic for all LSPs
                -- end,
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
			vim.keymap.set("n", "<leader>ds", vim.diagnostic.open_float, { desc = "Show Diagnostics" })
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous Diagnostic" })


            -- Toggle diagnostics globally
            vim.keymap.set("n", "<leader>dt", function()
              local disabled = vim.diagnostic.is_disabled()
              if disabled then
                vim.diagnostic.enable()
                print("Diagnostics enabled")
              else
                vim.diagnostic.disable()
                print("Diagnostics disabled")
              end
            end, { desc = "Toggle Diagnostics" })


			-- Editing and refactoring
			-- vim.keymap.set("n", "<leader>n", vim.lsp.buf.rename, { desc = "Rename Symbol" })
			-- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
			-- vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format, { desc = "Format Buffer" }) i think this worked. instead trying via filter.lua
		end,
	},
}
