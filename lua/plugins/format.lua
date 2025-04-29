return {
  "stevearc/conform.nvim", -- Lightweight autoformatter
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" }, -- Lua formatter
        go = { "gofmt", "goimports" }, -- Go formatters
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true, -- Use LSP if no formatter is found
      },
    })

    -- Keymap: Manually format with <leader>f
    vim.keymap.set("n", "<leader>f", function()
      require("conform").format({ async = true })
    end, { silent = true })
  end,
}

