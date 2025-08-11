return {
	{
		"williamboman/mason.nvim",
		cmd = { "Mason", "MasonUpdate", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
		config = function()
			require("mason").setup()
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"lua_ls",
				-- "rust_analyzer", -- Installed via rustup component add rust-analyzer
				-- "stylua",
				"eslint",
        "marksman",
			},
		},
		--		event = "VeryLazy",
		lazy = false,
	},

  {
    "neovim/nvim-lspconfig",

    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local on_attach = function(clint, _)
        if clint.server_capabilities.inlayHintProvider then
          vim.lsp.inlay_hint.enable(true)
        end

        vim.diagnostic.config({ virtual_text = true })
      end

      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        on_attach = on_attach,
      })

      vim.lsp.config("rust_analyzer", {
        capabilities = capabilities,
        on_attach = on_attach,
      })

      vim.lsp.config("marksman", {
        capabilities = capabilities,
        on_attach = on_attach,
      })
    end,

    lazy = false,

    keys = {
      { "<leader>ba", vim.lsp.buf.code_action, desc = "Show code actions" },
      { "K", vim.lsp.buf.hover, desc = "Show hover lsp action" },
      { "<leader>gd", vim.lsp.buf.definition, desc = "Goto definition" },
      { "<leader>gr", vim.lsp.buf.references, desc = "Goto references" },
      { "<leader>gf", vim.lsp.buf.format, desc = "Format document" },
    },
  },

  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      }
    }
  },

  {
    "folke/trouble.nvim",
    opts = {},
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },ee
  },
}
