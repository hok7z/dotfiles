local opt = vim.opt

vim.cmd[[
    syntax enable
    colorscheme tokyonight
]]

opt.encoding = "utf-8"
vim.g.did_load_filetypes = 1

opt.number = true
opt.relativenumber = true

opt.swapfile = false

opt.mouse = "a"
opt.cursorline = true
opt.colorcolumn = '80'

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.termguicolors = true
opt.listchars = {eol = '↲', tab = '▸ ', trail = '·'}
