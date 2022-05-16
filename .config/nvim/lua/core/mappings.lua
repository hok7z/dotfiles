local map = vim.keymap.set

map("n","<space>,",":nohlsearch<CR>")
map("n","<leader>m",":MarkdownPreview<CR>")
map("n","<leader>c",function() require("core.colorpicker") end)
-- Black arrows
vim.api.nvim_set_keymap('', '<up>', '<nop>',   { noremap = true })
vim.api.nvim_set_keymap('', '<down>', '<nop>', { noremap = true })
vim.api.nvim_set_keymap('', '<left>', '<nop>', { noremap = true })
vim.api.nvim_set_keymap('', '<right>', '<nop>',{ noremap = true })

-- NvimTree --
map("n","<C-n>",":NvimTreeToggle<CR>")
map("n","<leader>n",":NvimTreeFindFile<CR>")
map("n","<C-]>","gh defx#do_action('cd',getcwd())<CR>")

-- Telescope --
map("n","<leader>ff","<cmd> Telescope find_files <cr>")
map("n","<leader>fg","<cmd> Telescope live_grep <cr>")
map("n","<leader>fb","<cmd> Telescope buffers   <cr>")
map("n","<leader>fh","<cmd> Telescope help_tags <cr>")

-- barbar.nvim
map('n', '<A-,>', ':BufferPrevious<CR>')
map('n', '<A-.>', ':BufferNext<CR>')

-- Re-order to previous/next
map('n', '<A-<>', ':BufferMovePrevious<CR>')
map('n', '<A->>', ' :BufferMoveNext<CR>')

-- Goto buffer in position...
map('n', '<A-1>', ':BufferGoto 1<CR>')
map('n', '<A-2>', ':BufferGoto 2<CR>')
map('n', '<A-3>', ':BufferGoto 3<CR>')
map('n', '<A-4>', ':BufferGoto 4<CR>')
map('n', '<A-5>', ':BufferGoto 5<CR>')
map('n', '<A-6>', ':BufferGoto 6<CR>')
map('n', '<A-7>', ':BufferGoto 7<CR>')
map('n', '<A-8>', ':BufferGoto 8<CR>')
map('n', '<A-9>', ':BufferGoto 9<CR>')
map('n', '<A-0>', ':BufferLast<CR>')

-- Close buffer
map('n', '<A-c>', ':BufferClose<CR>')
map('n', '<C-p>', ':BufferPick<CR>')

-- Sort automatically by.
map('n', '<Space>bb', ':BufferOrderByBufferNumber<CR>')
map('n', '<Space>bd', ':BufferOrderByDirectory<CR>')
map('n', '<Space>bl', ':BufferOrderByLanguage<CR>')
