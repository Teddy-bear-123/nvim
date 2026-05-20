local map = vim.keymap.set

-- General keymaps
map('n', '<leader>o', ':restart<CR>')
map('n', '<leader>v', ':e $MYVIMRC<CR>')
map('n', '<leader>z', ':e ~/Dotfiles/.zshrc<CR>')
map('n', '<leader>s', ':e #<CR>')
map('n', '<leader>S', '<Cmd>bot sf #<CR>')
map({ 'n', 'v' }, '<leader>c', '1z=')

map({ 'n', 'v' }, '<leader>n', ':norm ')

map("n", "J", "mzJ`z", { noremap = true })

-- Insert mode navigation
map("i", "<C-h>", "<Esc>ha", { noremap = true })
map("i", "<C-j>", "<Esc>ja", { noremap = true })
map("i", "<C-k>", "<Esc>ka", { noremap = true })
map("i", "<C-l>", "<Esc>la", { noremap = true })


-- Visual mode
map('x', '<', '<gv^')
map('x', '>', '>gv^')

-- Terminal mode
map('t', '<Esc>', [[<C-\><C-n>]], { noremap = true })
map('t', '<C-h>', [[<C-\><C-n><C-w>h]])
map('t', '<C-j>', [[<C-\><C-n><C-w>j]])
map('t', '<C-k>', [[<C-\><C-n><C-w>k]])
map('t', '<C-l>', [[<C-\><C-n><C-w>l]])

-- Some how this works, lets me open files from Oil, and in buffers.
-- vim.keymap.set('n', '<C-O>', function()
-- 	local fname = vim.fn.expand('<cfile>') -- or '<cWORD>'?
-- 	if fname == nil or fname == '' then
-- 		vim.cmd('Open .')
-- 		return
-- 	end
-- 	vim.cmd('Open ' .. fname)
-- end, { noremap = true, silent = true, desc = "Open but kainda better." })


-- - "gra" (Normal and Visual mode) is mapped to |vim.lsp.buf.code_action()|
-- - "gri" is mapped to |vim.lsp.buf.implementation()|
-- - "grn" is mapped to |vim.lsp.buf.rename()|
-- - "grr" is mapped to |vim.lsp.buf.references()|
-- - "grt" is mapped to |vim.lsp.buf.type_definition()|
-- - "grx" is mapped to |vim.lsp.codelens.run()|
-- - "gO" is mapped to |vim.lsp.buf.document_symbol()|
-- - CTRL-S (Insert mode) is mapped to |vim.lsp.buf.signature_help()|
-- - |v_an| and |v_in| fall back to LSP |vim.lsp.buf.selection_range()| if
--   treesitter is not active.
-- - |gx| handles `textDocument/documentLink`. Example: with gopls, invoking gx
--   on "os" in this Go code will open documentation externally: >
--     package nvim
--     import (
--        "os"
--     )
-- <
-- These LSP features are enabled by default:
--
-- - Diagnostics |lsp-diagnostic|. See |vim.diagnostic.config()| to customize.
-- - `workspace/didChangeWatchedFiles` (except on Linux). If you see poor
--   performance in big workspaces, run `:checkhealth vim.lsp` and look for "file
--   watching". Try disabling file-watching: >lua
--     local capabilities = vim.lsp.protocol.make_client_capabilities()
--     if capabilities.workspace then
--       capabilities.workspace.didChangeWatchedFiles = nil
--     end
--     vim.lsp.config('*', {
--       capabilities = capabilities,
--     })
-- <
--

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
