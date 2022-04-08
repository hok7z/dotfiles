-- nvim-cmp setup
local cmp = require 'cmp'

cmp.setup {
    mapping = {
        ["<Tab>"]     = cmp.mapping.select_next_item(),
        ["<S-Tab>"]   = cmp.mapping.select_prev_item(),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"]      = cmp.mapping.confirm({ select = false }),
    },

    completion = {
        autocomplete = true
    },

    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },

    formatting = {
        format = function(entry, vim_item)
            local icons = require "plugins.lspkind_icons"
            vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)

            vim_item.menu = ({
                nvim_lsp = "[LSP]",
                nvim_lua = "[Lua]",
                buffer   = "[BUF]",
            })[entry.source.name]

            return vim_item
        end

        -- format = lspkind.cmp_format({
        --     with_text = false, -- do not show text alongside icons
        --     maxwidth = 50,
        --     before = function (entry, vim_item)
        --         return vim_item
        --     end
        -- })
  },

  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip'  },
  },
}
