-- Autosync packer
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost core/plugins.lua source <afile> | PackerCompile
  augroup end
]])
