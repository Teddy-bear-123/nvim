-- ~/.config/nvim/lua/config/keymaps.lua

local map = vim.keymap.set

-- Leader mappings
map('n', '<leader>o', ':update<CR> :source<CR>')
map('n', '<leader>v', ':e $MYVIMRC<CR>')
map('n', '<leader>z', ':e ~/.config/zsh/.zshrc<CR>')
map('n', '<leader>s', ':e #<CR>')
map('n', '<leader>S', ':sf #<CR>')

-- Clipboard operations
map({ 'n', 'v' }, '<leader>y', '"+y')
map({ 'n', 'v' }, '<leader>d', '"+d')

-- Spelling correction
map({ 'n', 'v' }, '<leader>c', '1z=')

-- Insert mode navigation
map("i", "<C-h>", "<Esc>ha", { noremap = true })
map("i", "<C-j>", "<Esc>ja", { noremap = true })
map("i", "<C-k>", "<Esc>ka", { noremap = true })
map("i", "<C-l>", "<Esc>la", { noremap = true })

-- Plugin-specific mappings (will be available after plugins load)
map('n', '<leader>f', ":Pick files<CR>")
map('n', '<leader>b', function() require("pear").jump_pair() end)
map('n', '<leader>h', ":Pick help<CR>")
map('n', '<leader>e', ":Oil<CR>")

-- LSP mappings
map('n', '<leader>lf', vim.lsp.buf.format)
map('n', 'gl', vim.diagnostic.open_float)
map('i', '<c-e>', function() vim.lsp.completion.get() end)
