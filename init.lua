vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.scrolloff = 17
vim.o.tabstop = 4 -- Tab width = 4 spaces
vim.o.shiftwidth = 4 -- Indent width = 4 spaces
vim.o.expandtab = true -- Use spaces instead of tabs
vim.o.relativenumber = true -- Enable relative line numbers
vim.o.number = true -- Show the absolute number on the current line
vim.opt.guicursor = "" -- Keep a bold cursor in all modes
vim.opt.mousehide = true -- Hide mouse while typing
vim.opt.wrap = false

-- Per-filetype indentation override
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
	callback = function()
		vim.bo.tabstop = 2
		vim.bo.shiftwidth = 2
		vim.bo.softtabstop = 2
		vim.bo.expandtab = true
	end,
})

vim.cmd("filetype plugin indent on")
vim.cmd("filetype plugin on")

require("config.lazy")
require("lazy").setup("plugins")

-- Navigate between references in the quickfix list
vim.keymap.set("n", "<leader>m", ":cprev<CR>", { desc = "Previous Reference" })
vim.keymap.set("n", "<leader>,", ":cnext<CR>", { desc = "Next Reference" })

-- Yank and paste to system clipboard
vim.keymap.set("n", "<leader>c", '"+y', { desc = "Yank to Clipboard" })
vim.keymap.set("v", "<leader>c", '"+y', { desc = "Yank to Clipboard (Visual)" })
vim.keymap.set("n", "<leader>v", '"+p', { desc = "Paste from Clipboard" })
vim.keymap.set("v", "<leader>v", '"+p', { desc = "Paste from Clipboard" })

-- German keys
vim.keymap.set("i", "<C-u>", "ü")
vim.keymap.set("i", "<C-o>", "ö")
vim.keymap.set("i", "<C-a>", "ä")
vim.keymap.set("i", "<C-U><C-U>", "Ü")
vim.keymap.set("i", "<C-O><C-O>", "Ö")
vim.keymap.set("i", "<C-A><C-A>", "Ä")
