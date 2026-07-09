-- lua/plugins/cmp.lua

return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      
      -- Make the completion window smaller and cleaner
      window = {
        completion = cmp.config.window.bordered({
          max_height = 10,     -- Show max 10 items at a time
          max_width = 50,      -- Limit the width of the completion menu
          scrollbar = false,   -- Hide the ugly scrollbar
        }),
        documentation = cmp.config.window.bordered({
          max_height = 15,
          max_width = 60,
        }),
      },
      
      -- Format how items look in the menu (adds icons and limits text length)
      formatting = {
        format = function(entry, vim_item)
          -- Optional: Add icons here later if you want (e.g., "ƒ" for functions)
          vim_item.menu = ({
            nvim_lsp = "[LSP]",
            luasnip  = "[Snip]",
            buffer   = "[Buf]",
            path     = "[Path]",
          })[entry.source.name]
          
          -- Truncate very long completion item names
          if string.len(vim_item.abbr) > 30 then
            vim_item.abbr = string.sub(vim_item.abbr, 1, 30) .. "..."
          end
          
          return vim_item
        end,
      },

      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        -- Manually toggle the huge documentation window (hidden by default)
        ["<C-d>"] = cmp.mapping(function()
          if cmp.visible_docs() then
            cmp.close_docs()
          else
            cmp.open_docs()
          end
        end),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      
      sources = cmp.config.sources({
        { name = "nvim_lsp", keyword_length = 1 },
        { name = "luasnip", keyword_length = 2 },
        { name = "buffer", keyword_length = 3 },
        { name = "path" },
      }),
    })
  end,
}
