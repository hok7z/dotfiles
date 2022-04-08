local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map("n","<space>,",":nohlsearch<CR>",opts)
map("n","<leader>m",":MarkdownPreview<CR>",opts)

-- Black arrows
map('', '<up>', '<nop>',   { noremap = true })
map('', '<down>', '<nop>', { noremap = true })
map('', '<left>', '<nop>', { noremap = true })
map('', '<right>', '<nop>',{ noremap = true })

-- NvimTree --
map("n","<C-n>",":NvimTreeToggle<CR>",opts)
map("n","<leader>n",":NvimTreeFindFile<CR>",opts)
map("n","<C-]>","gh defx#do_action('cd',getcwd())<CR>",opts)

-- Telescope --
map("n","<leader>ff","<cmd> Telescope find_files <cr>",opts)
map("n","<leader>fg","<cmd> Telescope live_grep <cr>",opts)
map("n","<leader>fb","<cmd> Telescope buffers   <cr>",opts)
map("n","<leader>fh","<cmd> Telescope help_tags <cr>",opts)

-- BufferLine --
map("n","bn",":BufferLineCycleNext <CR>",opts)
map("n","bp",":BufferLineCyclePrev <CR>",opts)
map("n","<silent>be",":BufferLineSotyByExtension <CR>",opts)
map("n","<silent>bd",":BufferLineSortByDirectory <CR>",opts)
