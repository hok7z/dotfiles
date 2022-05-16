local opt = vim.opt

vim.cmd "colorscheme tokyonight"

opt.encoding = "utf-8"
opt.swapfile = false
vim.g.did_load_filetypes = 1

local ok,notify = pcall(require,"notify")
if ok then
    vim.notify = notify
end

opt.number = true
opt.relativenumber = true

opt.mouse = "a"
opt.cursorline = true
opt.colorcolumn = '80'

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.termguicolors = true
opt.listchars = {eol = '↲', tab = '▸ ', trail = '·'}
