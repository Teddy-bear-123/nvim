local map = vim.keymap.set

-- General keymaps
map('n', '<leader>o', ':update<CR> :source<CR>')
map('n', '<leader>v', ':e $MYVIMRC<CR>')
map('n', '<leader>z', ':e ~/Dotfiles/.zshrc<CR>')
map('n', '<leader>s', ':e #<CR>')
map('n', '<leader>S', '<Cmd>bot sf #<CR>')
map({ 'n', 'v' }, '<leader>c', '1z=')

map({ 'n', 'v' }, '<leader>n', ':norm ')

-- Insert mode navigation
map("i", "<C-h>", "<Esc>ha", { noremap = true })
map("i", "<C-j>", "<Esc>ja", { noremap = true })
map("i", "<C-k>", "<Esc>ka", { noremap = true })
map("i", "<C-l>", "<Esc>la", { noremap = true })


-- Visual mode
map('x', '<', '<gv^')
map('x', '>', '>gv^')

-- Some how this works, lets me open files from Oil, and in buffers.
-- vim.keymap.set('n', '<C-O>', function()
-- 	local fname = vim.fn.expand('<cfile>') -- or '<cWORD>'?
-- 	if fname == nil or fname == '' then
-- 		vim.cmd('Open .')
-- 		return
-- 	end
-- 	vim.cmd('Open ' .. fname)
-- end, { noremap = true, silent = true, desc = "Open but kainda better." })


map('i', '<c-e>', function() vim.lsp.completion.get() end)

-- Plugin keymaps (loaded after plugins)
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        local telescope = require("telescope.builtin")
        -- Mini / Pick for files / buffers
        map('n', '<leader>q', require("mini.bufremove").delete)
        map('n', '<leader>f', ":Pick files<CR>")
        map('n', '<leader>h', ":Pick help<CR>")
        map('n', '<leader>r', ":Pick buffers<CR>")
        map('n', '<leader>e', ":Oil<CR>")


        -- Telescope
        map('n', '<leader>fg', telescope.live_grep, { desc = "Live grep" })
        map('n', '<leader>fb', telescope.buffers, { desc = "Buffers (Telescope)" })
        map('n', '<leader>fd', telescope.diagnostics, { desc = "Diagnostics (Telescope)" })
        map('n', '<leader>T', ':Telescope<CR>', { desc = "Telescoped" })


        -- Trouble
        map('n', '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>', { desc = "Diagnostics (Trouble)" })
        map('n', '<leader>xX', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', { desc = "Buffer diagnostics" })
        map('n', '<leader>cs', '<cmd>Trouble symbols toggle focus=false<cr>', { desc = "Symbols" })
        map('n', '<leader>cl', '<cmd>Trouble lsp toggle focus=false win.position=right<cr>', { desc = "LSP (Trouble)" })
        map('n', '<leader>xL', '<cmd>Trouble loclist toggle<cr>', { desc = "Location list" })
        map('n', '<leader>xQ', '<cmd>Trouble qflist toggle<cr>', { desc = "Quickfix list" })

        -- LSP
        map('n', '<leader>lf', vim.lsp.buf.format)
        map('n', 'gl', vim.diagnostic.open_float)
    end,
})
