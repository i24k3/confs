-- lua/plugins/autocomplete.lua
return {
  {
    "hrsh7th/nvim-cmp",  -- main completion plugin
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",    -- LSP completions
      "hrsh7th/cmp-buffer",      -- buffer completions
      "hrsh7th/cmp-path",        -- filesystem paths
      "hrsh7th/cmp-cmdline",     -- cmdline completions
      "L3MON4D3/LuaSnip",        -- snippets engine
      "saadparwaiz1/cmp_luasnip", -- snippet completions
      "rafamadriz/friendly-snippets", -- pre-made snippets
    },

        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },

                completion = {
                    completeopt = "menu,menuone,noinsert",
                },

                mapping = cmp.mapping.preset.insert({
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<C-M-Space>"] = cmp.mapping.complete(),


                    ["<C-j>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.jumpable(1) then
                            luasnip.jump(1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),

                    ["<C-k>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),

                --
                -- mapping = cmp.mapping.preset.insert({
                --   -- ["<Tab>"] = cmp.mapping.select_next_item(),
                --   -- ["<S-Tab>"] = cmp.mapping.select_prev_item(),
                --   ["<CR>"] = cmp.mapping.confirm({ select = true }),
                --   ["<C-CR>"] = cmp.mapping.complete(),
                --
                --
                --     -- Use Ctrl-j / Ctrl-k to navigate suggestions
                --     ['<C-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                --     ['<C-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                --
                -- }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "buffer" },
                    { name = "path" },
                }),
            })
        end,
    }
}



