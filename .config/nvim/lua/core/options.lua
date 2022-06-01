local opt = vim.opt

local ok,notify = pcall(require,"notify")
if ok then
    vim.notify = notify
end

vim.g.material_style = "deep ocean"
vim.cmd 'colorscheme material'

-- vim.g.catppuccin_flavour = "mocha"
-- vim.cmd "colorscheme catppuccin"

-- vim.g.tokyonight_style = "dark"
-- vim.cmd "colorscheme tokyonight"


opt.encoding = "utf-8"
opt.swapfile = false
vim.g.did_load_filetypes = 1

opt.ts = 4
opt.sw = 4

opt.number = true
opt.relativenumber = true
opt.splitright = true
opt.mouse = "a"
opt.cursorline = true
opt.colorcolumn = '80'

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.termguicolors = true
vim.g.icons = require("core.icons")
opt.listchars = {eol = '↲', tab = '▸ ', trail = '·'}
