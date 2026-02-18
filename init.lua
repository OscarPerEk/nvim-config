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
vim.keymap.set("n", "<leader>cp", function()
	local path = vim.fn.expand("%:.")
	local line = vim.fn.line(".")
	local result = path .. ":" .. line
	vim.fn.setreg("+", result)
	vim.notify(result, vim.log.levels.INFO)
end, { desc = "Copy file path:line to clipboard" })

-- German keys
vim.keymap.set("i", "<C-u>", "ü")
vim.keymap.set("i", "<C-o>", "ö")
vim.keymap.set("i", "<C-a>", "ä")
vim.keymap.set("i", "<C-U><C-U>", "Ü")
vim.keymap.set("i", "<C-O><C-O>", "Ö")
vim.keymap.set("i", "<C-A><C-A>", "Ä")

-- -- Insert a Go-style error check when pressing <leader>,
-- -- in insert mode. It pastes:
-- -- if err != nil {
-- --     return nil, err
-- -- }
-- vim.keymap.set("n", "<leader>,", function()
--   -- You can adjust the indentation/return values if needed.
--   local snippet = "if err != nil {\n\treturn nil, err\n}"
--   -- Insert the snippet at cursor
--   vim.api.nvim_put(vim.split(snippet, "\n"), "c", true, true)
--   -- Move cursor inside the block after the newline (optional tweak)
--   vim.cmd("normal! 2k$") -- place cursor at end of first line; adjust as desired
-- end, { noremap = true, silent = true })


-- ensure leader is set if not already
vim.g.mapleader = vim.g.mapleader or " "

vim.keymap.set("n", "<leader>,", function()
  -- Snippet to insert
  local snippet = "if err != nil {\n\treturn nil, err\n}"
  -- Insert at cursor (respecting current indent)
  vim.api.nvim_put(vim.split(snippet, "\n"), "c", true, true)
  -- Exit insert mode
  -- Then trigger <leader>f f in normal mode
  local seq = vim.api.nvim_replace_termcodes("<Esc>" .. vim.g.mapleader .. "f" .. "f", true, false, true)
  vim.api.nvim_feedkeys(seq, "n", false)
end, { noremap = true, silent = true })
