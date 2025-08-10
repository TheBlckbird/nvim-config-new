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
			},
		},
		--		event = "VeryLazy",
		lazy = false,
	},

  {
    "neovim/nvim-lspconfig",

    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local on_attach = function(clint, bufnr)
        if clint.server_capabilities.inlayHintProvider then
          vim.lsp.inlay_hint.enable(true)
        end
      end

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      lspconfig.rust_analyzer.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })
    end,
  }
}
