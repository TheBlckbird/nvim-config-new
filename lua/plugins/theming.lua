return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function() 
        vim.cmd[[colorscheme tokyonight]]
    end
  },

  {
    "folke/noice.nvim",
     event = "VeryLazy",
     dependencies = {
       "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
    opts = {},
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "auto",
      },
    },
  }
}
