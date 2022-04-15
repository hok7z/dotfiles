local nvim_lsp = require 'lspconfig'
local root_pattern = require "lspconfig.util".root_pattern
local lsp_servers = "/home/" .. vim.fn.expand("$USER") .. "/.local/share/nvim/lsp_servers/"

local utils = require("core.utils")

local function DiagnosticSign(name,icon,color)
    vim.fn.sign_define("DiagnosticSign" .. name,{ text=icon,texthl = "DiagnosticSign" .. name })
    utils.highlight{ "Diagnostic" .. name,fg = color}
end

local diagnostic_signs = {
    { name = "Error",icon = " ", color = "Red"       },
    { name = "Warn", icon = " ", color = "Yellow"    },
    { name = "Info", icon = " ", color = "Yellow"    },
    { name = "Hint", icon = " ", color = "LightBlue" }
}

for _,sign in ipairs(diagnostic_signs) do
    DiagnosticSign(sign.name,sign.icon,sign.color)
end

local on_attach = function(client,bufnr)
    print('Attaching to: ' .. client.name)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr,...) end
    --local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr,...) end
    local opts = {noremap = true,silent=true}

    -- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    buf_set_keymap('n','gd','<cmd>lua vim.lsp.buf.definition()<CR>',opts)
    buf_set_keymap('n','K', '<cmd>lua vim.lsp.buf.hover()<CR>',opts)
    buf_set_keymap('n','[d','<cmd>lua vim.diagnostic.goto_prev()<CR>',opts)
    buf_set_keymap('n',']d','<cmd>lua vim.diagnostic.goto_next()<CR>',opts)
    buf_set_keymap('n','<leader>d','<cmd>lua vim.diagnostic.open_float()<CR>',opts)
    buf_set_keymap('n','<silent>f','<cmd>lua vim.lsp.buf.formatting()<CR>',opts)
end

-- LSP Servers

nvim_lsp.clangd.setup {
    filetypes = {"c","cpp","objc","objcpp"},
    on_attach = on_attach,
    root_dir = root_pattern {
        "CMakeList.txt",
        "compile_flags.txt",
        ".git",
        vim.fn.getcwd()
    }
}

nvim_lsp.pyright.setup{
    on_attach = on_attach,
    flags = {
        debounce_text_changes = 150,
    }
}

nvim_lsp.gopls.setup {
    cmd = { lsp_servers .. "go/gopls","serve" },
    filetypes = {"go", "gomod"},
    on_attach = on_attach,
    root_dir = root_pattern{
        "go.mod",
        ".git",
        vim.fn.getcwd(),
    },
}

nvim_lsp.sumneko_lua.setup {
    cmd = {lsp_servers .. "sumneko_lua/extension/server/bin/lua-language-server", "-E",lsp_servers .. "sumneko_lua/extension/server/bin/main.lua"},
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
                path = vim.split(package.path, ';')
            },

            diagnostics = {
                globals = {'vim'}
            },

            workspace = {
                library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true}
            }
        }
    }
}

nvim_lsp.zk.setup{
    cmd = {"zk" ,"lsp"},
    filetypes = { "markdown" },
    on_attach = on_attach,
    root_dir = root_pattern{
        ".zk",
        vim.fn.getcwd()
    }
}
