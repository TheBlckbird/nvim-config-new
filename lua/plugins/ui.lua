return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    event = "VeryLazy",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
        }
      },
    },
    keys = {
      { "<leader>e", "<cmd>Neotree filesystem toggle left<CR>", desc = "Toggle Neotree" },
      { "<leader>n", "<cmd>Neotree filesystem reveal left<CR>", desc = "Reveal Neotree" },
    },
  },
}
