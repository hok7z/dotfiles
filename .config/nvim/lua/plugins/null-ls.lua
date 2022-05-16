local ok,null_ls = pcall(require,"null-ls")
if not ok then
    vim.notify("Failed to load null-ls\n\n")
    return
end

local h = require("null-ls.helpers")
local m = require("null-ls.methods")

local formatting = null_ls.builtins.formatting

local jq_format = h.make_builtin {
    name = "jq",
    method = m.internal.FORMATTING,
    filetypes = {"json"},
    generator_opts = {
        command = "jq",
        args = {"-M", "."},
        to_stdin = true,
    },

    factory = h.formatter_factory,
}

null_ls.setup{
    sources = {
        formatting.black,
        jq_format
    }
}
