local h = require("null-ls.helpers")
local m = require("null-ls.methods")

local formatting = require("null-ls").builtins.formatting

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

require("null-ls").setup({
    sources = {
        formatting.black,
        jq_format,
    }
})
