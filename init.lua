local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out,                            "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)


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

local map = vim.keymap.set

vim.g.mapleader = " "
map('n', '<leader>o', ':update<CR> :source<CR>')
map('n', '<leader>v', ':e $MYVIMRC<CR>')
map('n', '<leader>z', ':e ~/.config/zsh/.zshrc<CR>')
map('n', '<leader>s', ':e #<CR>')
map('n', '<leader>S', ':sf #<CR>')
map({ 'n', 'v' }, '<leader>y', '"+y')
map({ 'n', 'v' }, '<leader>d', '"+d')
map({ 'n', 'v' }, '<leader>c', '1z=')
map("i", "<C-h>", "<Esc>ha", { noremap = true })
map("i", "<C-j>", "<Esc>ja", { noremap = true })
map("i", "<C-k>", "<Esc>ka", { noremap = true })
map("i", "<C-l>", "<Esc>la", { noremap = true })

require("lazy").setup({
	spec = {
		{ "vague2k/vague.nvim",    opts = { transparent = true } },
		{ "stevearc/oil.nvim",     config = true },
		{ "echasnovski/mini.pick", version = false,              config = true },
		{
			"nvim-treesitter/nvim-treesitter",
			build = ":TSUpdate",
			opts = {
				highlight = { enable = true },
			}
		},
		{ "chomosuke/typst-preview.nvim" },
		{ "neovim/nvim-lspconfig" },
		{ "mason-org/mason.nvim",        config = true },
		{ "NvChad/showkeys",             opts = { position = "top-right" } },
		{ "L3MON4D3/LuaSnip" },
	},
	install = { colorscheme = { "vague" } },
	checker = { enabled = true },
})



-- vim.pack.add({
-- 	{ src = "https://github.com/vague2k/vague.nvim" },
-- 	{ src = "https://github.com/stevearc/oil.nvim" },
-- 	{ src = "https://github.com/echasnovski/mini.pick" },
-- 	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
-- 	{ src = "https://github.com/chomosuke/typst-preview.nvim" },
-- 	{ src = 'https://github.com/neovim/nvim-lspconfig' },
-- 	{ src = "https://github.com/mason-org/mason.nvim" },
-- 	{ src = 'https://github.com/NvChad/showkeys',                 opt = true },
-- 	{ src = "https://github.com/L3MON4D3/LuaSnip" },
-- })



require "mason".setup()
require "mini.pick".setup()
require "oil".setup()


map('n', '<leader>f', ":Pick files<CR>")
map('n', '<leader>h', ":Pick help<CR>")
map('n', '<leader>e', ":Oil<CR>")
map('n', '<leader>lf', vim.lsp.buf.format)
map('n', 'gl', vim.diagnostic.open_float)


vim.lsp.enable({ "lua_ls", "jdtls", "clangd" })
require('nvim-treesitter.configs').setup({ highlight = { enable = true, }, })

require "vague".setup({ transparent = false })
vim.cmd("colorscheme vague")
vim.cmd(":hi statusline guibg=NONE")
