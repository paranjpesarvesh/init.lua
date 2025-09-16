return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "j-hui/fidget.nvim",
    },
    config = function()
      -- Setup mason.nvim
      require("mason").setup()

      -- Setup mason-lspconfig.nvim
      require("mason-lspconfig").setup {
        ensure_installed = { "lua_ls", "rust_analyzer", "gopls", "zls" }, -- Servers to install
        automatic_installation = true, -- Auto-install servers
      }

      -- Setup fidget.nvim (progress UI)
      require("fidget").setup()

      -- LSP keybindings
      local opts = { noremap = true, silent = true }
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
      vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
      vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
      vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
      vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
      vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
      vim.keymap.set("n", "<leader>zig", function() vim.cmd("LspRestart") end, opts)

      -- Setup LSP servers
      local lspconfig = require("lspconfig")
      require("mason-lspconfig").setup_handlers({
        -- Default handler for all servers
        function(server_name)
          lspconfig[server_name].setup({})
        end,
        -- Custom handler for lua_ls
        ["lua_ls"] = function()
          lspconfig.lua_ls.setup({
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" }, -- Recognize vim global
                },
              },
            },
          })
        end,
      })
    end,
  },
}
