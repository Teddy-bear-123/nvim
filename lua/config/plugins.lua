require("lazy").setup({
	spec = {
		{ "Shatur/neovim-ayu",     priority = 1000, lazy = false },
		{ "stevearc/oil.nvim",     config = true },
		{ "echasnovski/mini.pick", version = false, config = true },
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
		{ "L3MON4D3/LuaSnip" },
	},
	-- install = { colorscheme = { "vague" } },
	checker = { enabled = true },
})
