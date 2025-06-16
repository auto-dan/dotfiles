return {
    {
        "romgrk/barbar.nvim",
        dependencies = {
          'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
          'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
        }
    },
    "burntsushi/ripgrep",
    {"nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("telescope").setup()
    end
    },
    "folke/tokyonight.nvim",
    "nvim-tree/nvim-web-devicons",
    "github/copilot.vim",
    "karb94/neoscroll.nvim",
    "voldikss/vim-floaterm",
    {
      "nvim-treesitter/nvim-treesitter",
      lazy = false,
      build = ":TSUpdate",
      config = function()
        -- Standard treesitter setup
        require("nvim-treesitter.configs").setup({
          ensure_installed = {
            "python", "lua", "javascript", "typescript", "json", "html", "css"
          },
          auto_install = true,
          highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
          },
        })

        -- Optional auto-updater
        local ts_update_path = vim.fn.stdpath("data") .. "/tsupdate-timestamp"
        local update_interval_days = 7

        local function needs_tsupdate()
          local f = io.open(ts_update_path, "r")
          local last = f and tonumber(f:read("*a")) or 0
          if f then f:close() end

          local now = os.time()
          local days = (now - last) / (60 * 60 * 24)
          return days >= update_interval_days
        end

        if needs_tsupdate() then
          vim.api.nvim_create_autocmd("VimEnter", {
            callback = function()
              vim.cmd("TSUpdate")
              local f = io.open(ts_update_path, "w")
              if f then
                f:write(os.time())
                f:close()
              end
            end,
          })
        end
      end,
    },
    "nvim-treesitter/playground",
    "mbbill/undotree",
    "tpope/vim-fugitive",
    "tpope/vim-dadbod",
    "kristijanhusak/vim-dadbod-ui",
    "kristijanhusak/vim-dadbod-completion",
    "folke/trouble.nvim",
    "startup-nvim/startup.nvim",
    {
      "folke/tokyonight.nvim",
      lazy = false,
      priority = 1000,
      opts = {},
    },
    { "karb94/neoscroll.nvim", opts = {} }
}
