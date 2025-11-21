return {
  -- LSP + Mason
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local mason = require("mason")
      local mason_lspconfig = require("mason-lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      
      mason.setup()
      mason_lspconfig.setup({
        ensure_installed = {
          "pyright",
          "ts_ls",
          "rust_analyzer",
        },
        automatic_installation = true,
      })
      
      mason_lspconfig.setup_handlers({
        function(server_name)
          if server_name == "rust_analyzer" then
            vim.lsp.config[server_name] = {
              cmd = { "rust-analyzer" },
              root_markers = { "Cargo.toml", "rust-project.json" },
              capabilities = capabilities,
              settings = {
                ["rust-analyzer"] = {
                  cargo = { allFeatures = true },
                  check = { command = "clippy" },
                },
              },
            }
          else
            vim.lsp.config[server_name] = {
              capabilities = capabilities,
            }
          end
          vim.lsp.enable(server_name)
        end,
      })
    end,
  },
  
  -- Completion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip"
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
        },
      })
    end,
  },
}
