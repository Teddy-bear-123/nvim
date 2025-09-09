vim.cmd([[set mouse=]])
vim.opt.winborder = "rounded"
vim.opt.hlsearch = false
vim.opt.tabstop = 2
vim.opt.cursorcolumn = false
vim.opt.ignorecase = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.signcolumn = "yes"
vim.opt.clipboard = "unnamedplus"

-- Set leader key
vim.g.mapleader = " "




vim.pack.add({
	{ src = "https://github.com/vague2k/vague.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/echasnovski/mini.pick" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	-- { src = "nvim-treesitter/nvim-treesitter-textobjects" },
	{ src = "https://github.com/chomosuke/typst-preview.nvim" },
	{ src = 'https://github.com/neovim/nvim-lspconfig' },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
	{ src = "https://github.com/SylvanFranklin/pear" },
})



local map = vim.keymap.set

map('n', '<leader>o', ':update<CR> :source<CR>')
map('n', '<leader>v', ':e $MYVIMRC<CR>')
map('n', '<leader>z', ':e ~/.config/zsh/.zshrc<CR>')
map('n', '<leader>s', ':e #<CR>')
map('n', '<leader>S', ':sf #<CR>')

map({ 'n', 'v' }, '<leader>c', '1z=')

map("i", "<C-h>", "<Esc>ha", { noremap = true })
map("i", "<C-j>", "<Esc>ja", { noremap = true })
map("i", "<C-k>", "<Esc>ka", { noremap = true })
map("i", "<C-l>", "<Esc>la", { noremap = true })

map('n', '<leader>f', ":Pick files<CR>")
map('n', '<leader>h', ":Pick help<CR>")
map('n', '<leader>e', ":Oil<CR>")

map('n', '<leader>lf', vim.lsp.buf.format)
map('n', 'gl', vim.diagnostic.open_float)
map('i', '<c-e>', function() vim.lsp.completion.get() end)


require("mason").setup()
require("oil").setup()

vim.lsp.enable({ "lua_ls", "jdtls", "clangd" })


require("mini.pick").setup({
	mappings = {
		choose_marked = "<C-G>"
	}
})

require('nvim-treesitter.configs').setup({ 
	highlight = { enable = true, },
})

-- Color scheme stuff, decided to live with ayu at some point so im still here
--
vim.cmd.colorscheme("ayu-dark")

local function set_custom_highlights()
	local brighter_guide = "#4B5263" -- changed `LineNr` to be brigher
	vim.api.nvim_set_hl(0, "LineNr", { fg = brighter_guide })
end

set_custom_highlights()

-- Hide end-of-buffer markers
vim.cmd("highlight EndOfBuffer guibg=bg guifg=bg")

