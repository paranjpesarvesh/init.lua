return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      { "mason-org/mason-lspconfig.nvim", version = ">=2.0.0" },
      "hrsh7th/cmp-nvim-lsp",
      "j-hui/fidget.nvim",
      "SmiteshP/nvim-navic",
    },

    config = function()
      ----------------------------------------------------------------
      -- 1. Mason
      ----------------------------------------------------------------
      require("mason").setup()

      ----------------------------------------------------------------
      -- 2. mason-lspconfig
      ----------------------------------------------------------------
      local mason_lsp = require("mason-lspconfig")
      mason_lsp.setup({
        ensure_installed = {
          "lua_ls",
          "rust_analyzer",
          "gopls",
          "pyright",
          "zls",
        },
        automatic_installation = true,
      })

      ----------------------------------------------------------------
      -- 3. Capabilities (nvim-cmp)
      ----------------------------------------------------------------
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      ----------------------------------------------------------------
      -- 4. Common on_attach
      ----------------------------------------------------------------
      local on_attach = function(client, bufnr)
        local opts = { buffer = bufnr, silent = true }

        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

        -- Breadcrumbs (safe attach)
        if client.server_capabilities.documentSymbolProvider then
          require("nvim-navic").attach(client, bufnr)
        end
      end

      ----------------------------------------------------------------
      -- 5. Server configs (NEW native API)
      ----------------------------------------------------------------

      -- Lua
      vim.lsp.config.lua_ls = {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
          },
        },
      }

      -- Python
      vim.lsp.config.pyright = {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          python = {
            analysis = {
              autoSearchPaths = true,
              diagnosticMode = "workspace",
              useLibraryCodeForTypes = true,
            },
          },
        },
      }

      -- Go
      vim.lsp.config.gopls = {
        capabilities = capabilities,
        on_attach = on_attach,
      }

      -- Rust
      vim.lsp.config.rust_analyzer = {
        capabilities = capabilities,
        on_attach = on_attach,
      }

      -- Zig
      vim.lsp.config.zls = {
        capabilities = capabilities,
        on_attach = on_attach,
      }

      ----------------------------------------------------------------
      -- 6. Fidget (LSP progress)
      ----------------------------------------------------------------
      require("fidget").setup({})
    end,
  },
}

