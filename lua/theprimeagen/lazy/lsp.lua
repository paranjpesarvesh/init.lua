-- ~/.config/nvim/lua/theprimeagen/lazy/lsp.lua
return {
  {
    "neovim/nvim-lspconfig",  -- Keep for :LspInfo, etc.
    dependencies = {
      "williamboman/mason.nvim",
      { "mason-org/mason-lspconfig.nvim", version = ">=2.0.0" },
      "j-hui/fidget.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },

    config = function()
      ----------------------------------------------------------------
      -- 1. Mason: Install servers
      ----------------------------------------------------------------
      require("mason").setup()

      ----------------------------------------------------------------
      -- 2. mason-lspconfig: Auto-install + auto-enable
      ----------------------------------------------------------------
      local mason_lsp = require("mason-lspconfig")
      mason_lsp.setup({
        ensure_installed = { "lua_ls", "rust_analyzer", "gopls", "zls" },
        automatic_installation = true,
        automatic_enable = { "lua_ls", "rust_analyzer", "gopls", "zls" }, -- Enables them
      })

      ----------------------------------------------------------------
      -- 3. Capabilities for nvim-cmp
      ----------------------------------------------------------------
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      ----------------------------------------------------------------
      -- 4. Define LSP configs (NEW NATIVE WAY)
      ----------------------------------------------------------------
      -- lua_ls: special config
      vim.lsp.config.lua_ls = {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
          },
        },
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          -- Optional: keymaps
          local opts = { buffer = bufnr, noremap = true, silent = true }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        end,
      }

      -- Other servers: minimal config
      local default_cfg = { capabilities = capabilities }
      for _, server in ipairs({ "rust_analyzer", "gopls", "zls" }) do
        vim.lsp.config[server] = default_cfg
      end

      ----------------------------------------------------------------
      -- 5. Fidget: LSP progress
      ----------------------------------------------------------------
      require("fidget").setup({})
    end,
  },
}
