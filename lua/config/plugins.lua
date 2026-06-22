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
        {
            "NeogitOrg/neogit",
            lazy = true,
            dependencies = {
                "esmuellert/codediff.nvim",
                "m00qek/baleia.nvim",
                "nvim-telescope/telescope.nvim",
            },
            cmd = "Neogit",
            keys = {
                { "<leader>gg", "<cmd>Neogit<cr>", desc = "Show Neogit UI" }
            }
        }
        -- {
        -- 	"wstucco/c3.nvim",
        -- 	config = function()
        -- 		require("c3")
        -- 	end,
        -- },
    },
    checker = { enabled = true },
})

vim.cmd.packadd("nvim.undotree")
