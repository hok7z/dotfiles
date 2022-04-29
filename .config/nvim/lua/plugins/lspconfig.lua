local nvim_lsp = require 'lspconfig'
local utils = require "core.utils"
local root_pattern = require "lspconfig.util".root_pattern
local lsp_servers = "/home/" .. vim.fn.expand("$USER") .. "/.local/share/nvim/lsp_servers/"

--local notify = utils.require_mod("notify")

local function DiagnosticSign(name,icon,color)
    vim.fn.sign_define("DiagnosticSign" .. name,{ text=icon,texthl = "DiagnosticSign" .. name })
    utils.highlight{ "Diagnostic" .. name,fg = color}
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local diagnostic_signs = {
    { name = "Error",icon = " ", color = "Red"       },
    { name = "Warn", icon = " ", color = "Yellow"    },
    { name = "Info", icon = " ", color = "Yellow"    },
    { name = "Hint", icon = " ", color = "LightBlue" }
}

for _,sign in ipairs(diagnostic_signs) do
    DiagnosticSign(sign.name,sign.icon,sign.color)
end

-- TODO: create notify used LSP server
local on_attach = function(client,bufnr)
    --notify("Attaching to: " .. client.name,"info",{title = "LSP Server"})
    print("Attaching to: ",client.name)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr,...) end
    --local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr,...) end
    local opts = {noremap = true,silent=true}

    -- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    buf_set_keymap('n','gd','<cmd>lua vim.lsp.buf.definition()<CR>',opts)
    buf_set_keymap('n','K', '<cmd>lua vim.lsp.buf.hover()<CR>',opts)
    buf_set_keymap('n','[d','<cmd>lua vim.diagnostic.goto_prev()<CR>',opts)
    buf_set_keymap('n',']d','<cmd>lua vim.diagnostic.goto_next()<CR>',opts)
    buf_set_keymap('n','<leader>d','<cmd>lua vim.diagnostic.open_float({border="rounded"})<CR>',opts)
    buf_set_keymap('n','<space>f','<cmd>lua vim.lsp.buf.formatting()<CR>',opts)
end

vim.diagnostic.config{
    virtual_text = true,
    signs = false,
    underline = true,
    update_in_insert = false,
    severity_sort = false,
    float =  { border = "rounded" },
}

local handlers =  {
    ["textDocument/hover"]         =  vim.lsp.with(vim.lsp.handlers.hover, {border = "rounded"}),
    ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = "rounded" }),
}


-- LSP Servers

nvim_lsp.clangd.setup {
    filetypes = {"c","cpp","objc","objcpp"},
    on_attach = on_attach,
    handlers = handlers,
    capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities),
    root_dir = root_pattern {
        "CMakeList.txt",
        "compile_flags.txt",
        ".git",
        vim.fn.getcwd()
    }
}

nvim_lsp.pyright.setup{
    on_attach = on_attach,
    handlers = handlers,
    capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities),
    flags = {
        debounce_text_changes = 150,
    }
}

nvim_lsp.gopls.setup {
    cmd = { lsp_servers .. "go/gopls","serve" },
    filetypes = {"go", "gomod"},
    on_attach = on_attach,
    handlers = handlers,
    capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities),
    root_dir = root_pattern{
        "go.mod",
        ".git",
        vim.fn.getcwd(),
    },
}

-- Fix:slowly load sumneko
local sumneko_binary = vim.fn.exepath('lua-language-server')
local sumneko_root_path = vim.fn.fnamemodify(sumneko_binary, ':h')

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

nvim_lsp.sumneko_lua.setup{
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    filetype = {"lua"},
    capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities),
    handlers = handlers,

    root_dir = root_pattern{
        ".luarc.json",
        ".luacheckrc",
        ".stylua.toml",
        "selene.toml",
        ".git"
    },
 
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
                path = runtime_path,
            },

            diagnostics = {
                globals = {'vim'}
            },

            workspace = {
                library = vim.api.nvim_get_runtime_file("",true),
                --library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true}
            },

            telemetry = {
                enable = false,
            },

        },

    },
}
