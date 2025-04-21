return {
    {
        "romgrk/barbar.nvim",
        dependencies = {
          'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
          'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
        }
    },
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "folke/tokyonight.nvim",
    "nvim-tree/nvim-web-devicons",
    "github/copilot.vim",
    "karb94/neoscroll.nvim",
    "voldikss/vim-floaterm",
    "nvim-treesitter/nvim-treesitter",
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
