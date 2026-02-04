return {
  "stevearc/conform.nvim",
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        -- Choose one: just Black, or isort then Black
        python = { "isort", "black" }, -- or { "black" }
        lua = { "stylua" },
        go = { "gofmt", "goimports" },
      },
      format_on_save = {
        timeout_ms = 2000,
        lsp_fallback = false,
      },
      formatters = {
        black = {
          -- Run via Poetry; read settings from pyproject.toml
          command = "poetry",
          args = { "run", "black", "--quiet", "-" },
          stdin = true,
        },
        isort = {
          command = "poetry",
          args = { "run", "isort", "--profile", "black", "-" },
          stdin = true,
        },
        -- If you prefer Ruff formatter instead of Black:
        -- ruff_format = {
        --   command = "poetry",
        --   args = { "run", "ruff", "format", "--stdin-filename", "$FILENAME", "-" },
        --   stdin = true,
        -- },
      },
    })

    vim.keymap.set("n", "<leader>ff", function()
      conform.format({ async = true })
    end, { silent = true, desc = "Format buffer" })
  end,
}




-- return {
--   "stevearc/conform.nvim", -- Lightweight autoformatter
--   config = function()
--     local conform = require("conform")
--
--     conform.setup({
--       formatters_by_ft = {
--         python = { "black" },
--         lua = { "stylua" },              -- Lua formatter
--         go = { "gofmt", "goimports" },   -- Go formatters
--         -- Python: Black (optionally add isort first)
--         -- python = { "isort", "black" },
--       },
--       format_on_save = {
--         timeout_ms = 1000,   -- give Black a bit more time
--         lsp_fallback = false, -- Use LSP if no formatter is found
--       },
--       -- Optional: override formatter args
--       formatters = {
--         black = {
--           -- prepend_args = { "--line-length", "120" }, -- or omit to use pyproject.toml
--         },
--         -- If you enable isort above, align it with Black’s style:
--         -- isort = { prepend_args = { "--profile", "black" } },
--       },
--     })
--
--     -- Keymap: Manually format with <leader>ff
--     vim.keymap.set("n", "<leader>ff", function()
--       conform.format({ async = true })
--     end, { silent = true, desc = "Format buffer" })
--   end,
-- }
--
