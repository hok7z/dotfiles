local ok,nvim_treesitter_configs = pcall(require,"nvim-treesitter.configs")
if not ok then
    vim.notify("Failed to load nvim-treesitter\n\n")
    return
end

nvim_treesitter_configs.setup {
    highlight = {
        enable = true,
        disable = {},
    },
    indent = {
        enable = false,
        disable = {},
    },
    ensure_installed = {
        "c",
        "cpp",
        "vim",
        "lua",
        "bash",
        "python",
        "go"
    },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
