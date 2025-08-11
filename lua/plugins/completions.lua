return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },

  {
    "hrsh7th/nvim-cmp",
    event = "BufEnter",
    config = function()
      local cmp = require("cmp")
      require("luasnip.loaders.from_vscode").lazy_load()
      local luasnip = require("luasnip")
      local lspkind = require("lspkind")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },

        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },

        mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),

          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, {"i", "s"}),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, {"i", "s"}),
				}),

        sources = cmp.config.sources({
          { name = "luasnip" },
          { name = "nvim_lsp" },
          { name = "path" },
          { name = "buffer" },
          { name = "lazydev", group_index = 0 },
        }),

        formatting = {
          format = lspkind.cmp_format(),
        },
      })

      -- Add brackets after functions
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      cmp.event:on(
        "confirm_done",
        cmp_autopairs.on_confirm_done()
      )

      -- Visual Studio Code Dark+ colors for ontries

      -- gray
      vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { bg='NONE', strikethrough=true, fg='#808080' })
      -- blue
      vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { bg='NONE', fg='#569CD6' })
      vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { link='CmpIntemAbbrMatch' })
      -- light blue
      vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { bg='NONE', fg='#9CDCFE' })
      vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { link='CmpItemKindVariable' })
      vim.api.nvim_set_hl(0, 'CmpItemKindText', { link='CmpItemKindVariable' })
      -- pink
      vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { bg='NONE', fg='#C586C0' })
      vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { link='CmpItemKindFunction' })
      -- front
      vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { bg='NONE', fg='#D4D4D4' })
      vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { link='CmpItemKindKeyword' })
      vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { link='CmpItemKindKeyword' })
    end
  },

  {
    "onsails/lspkind.nvim",
  },

  -- Sources

  {
    "hrsh7th/cmp-buffer",
    event = "BufEnter",
  },

  {
    "hrsh7th/cmp-path",
    event = "BufEnter",
  },

  {
    "L3MON4D3/LuaSnip",
    dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
  },

  {
    "hrsh7th/cmp-nvim-lsp",
  },
}
