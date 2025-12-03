return {
  -- 1. mason.nvim
  {
    "mason-org/mason.nvim",
    build = ":MasonUpdate",
    opts = {}, -- default config
  },

  -- 2. mason-lspconfig.nvim
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim" },
    opts = {
      ensure_installed = { "lua_ls", "ts_ls" },
      automatic_installation = false,
    },
  },

  -- 3. nvim-lspconfig with LSP handlers
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason-org/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "ts_ls" },
        automatic_installation = false,
      })

      -- Keymaps for LSP
      vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>', { silent = true })
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { noremap = true, silent = true, desc = "Rename symbol" })

    end,
  },
}
