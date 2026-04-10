require("lazy").setup({
    spec = {
        { "Shatur/neovim-ayu",        priority = 1000, lazy = false },
        { "stevearc/oil.nvim",        config = true },
        { "echasnovski/mini.pick",    version = false, config = true },
        { "nvim-mini/mini.bufremove", version = false },
        {
            "nvim-treesitter/nvim-treesitter",
            -- commit = "c82bf96f0a773d85304feeb695e1e23b2207ac35",
            branch = 'main',
            build = ":TSUpdate",
            opts = {
                highlight = { enable = true },
            },
            priority = 1000,
            lazy = false,
        },
        { "chomosuke/typst-preview.nvim" },
        { "neovim/nvim-lspconfig" },
        { "mason-org/mason.nvim",        config = true },
        { "L3MON4D3/LuaSnip" },
        { "folke/trouble.nvim",          opts = {},    cmd = "Trouble", },
        {
            "nvim-telescope/telescope.nvim",
            dependencies = {
                "nvim-lua/plenary.nvim" },
        },
        -- {
        -- 	"wstucco/c3.nvim",
        -- 	config = function()
        -- 		require("c3")
        -- 	end,
        -- },
    },
    checker = { enabled = true },
})
