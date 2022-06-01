-- nvim-cmp setup

local ok,cmp = pcall(require,"cmp")
if not ok then
    vim.notify("Failed to load cmp\n\n")
    return
end

cmp.setup {
    mapping = {
        ["<Tab>"]     = cmp.mapping.select_next_item(),
        ["<S-Tab>"]   = cmp.mapping.select_prev_item(),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"]      = cmp.mapping.confirm({ select = false }),
    },

    completion = {
        autocomplete = true,
        completeopt = "menu,menuone,noinsert",
    },

    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },

    window = {
        completion    = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered()
    },

    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = string.format("%s %s",vim.g.icons.kind[vim_item.kind], vim_item.kind)

            vim_item.menu = ({
                nvim_lsp = "[LSP]",
                nvim_lua = "[Lua]",
                buffer   = "[BUF]",
            })[entry.source.name]

            return vim_item
        end

    },

  sources = {
    { name = "nvim_lsp"},
    { name = "luasnip" },
    { name = "emoji"   },
    { name = "calc"    },
  },
}
