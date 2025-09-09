local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

-- Install your plugins here
return packer.startup(function(use)
    use({ "wbthomason/packer.nvim" })                                                     -- Have packer manage itself
    use({ "nvim-lua/plenary.nvim", commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7" }) -- Useful lua functions used by lots of plugins
    use({ "windwp/nvim-autopairs", commit = "4fc96c8f3df89b6d23e5092d31c866c53a346347" }) -- Autopairs, integrates with both cmp and treesitter
    use({ "numToStr/Comment.nvim", commit = "97a188a98b5a3a6f9b1b850799ac078faa17ab67" })
    use({ "JoosepAlviste/nvim-ts-context-commentstring", commit = "4d3a68c41a53add8804f471fcc49bb398fe8de08" })
    use({ "kyazdani42/nvim-web-devicons", commit = "563f3635c2d8a7be7933b9e547f7c178ba0d4352" })
    use({ "kyazdani42/nvim-tree.lua", commit = "7282f7de8aedf861fe0162a559fc2b214383c51c" })
    use({ "akinsho/bufferline.nvim", tag = "*", requires = "nvim-tree/nvim-web-devicons" })
    use({ "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" })
    use({ "nvim-lualine/lualine.nvim", commit = "a52f078026b27694d2290e34efa61a6e4a690621" })
    use({ "akinsho/toggleterm.nvim", commit = "2a787c426ef00cb3488c11b14f5dcf892bbd0bda" })
    use({ "ahmedkhalf/project.nvim", commit = "628de7e433dd503e782831fe150bb750e56e55d6" })
    use({ "lewis6991/impatient.nvim", commit = "b842e16ecc1a700f62adb9802f8355b99b52a5a6" })
    use({ "lukas-reineke/indent-blankline.nvim", main = "ibl"})
    use({ "goolord/alpha-nvim" })
    use({ "folke/which-key.nvim", branch = "v3" })
    use({ "neoclide/coc.nvim", branch = "release" })
    -- Colorschemes
    use({ "folke/tokyonight.nvim" })
    use({ "lunarvim/darkplus.nvim" })
    use({ "rose-pine/neovim", as = "rose-pine" })
    use({ "Shatur/neovim-ayu" })
    -- Cmp
    use({ "hrsh7th/nvim-cmp" })         -- The completion plugin
    use({ "hrsh7th/cmp-buffer" })       -- buffer completions
    use({ "hrsh7th/cmp-path" })         -- path completions
    use({ "saadparwaiz1/cmp_luasnip" }) -- snippet completions
    use({ "hrsh7th/cmp-nvim-lsp" })
    use({ "hrsh7th/cmp-nvim-lua" })
    use({ "tzachar/cmp-ai" })

    -- Github copilot

    use({ "github/copilot.vim" })
    -- Snippets
    use({ "L3MON4D3/LuaSnip" })             --snippet engine
    use({ "rafamadriz/friendly-snippets" }) -- a bunch of snippets to use
    use({ "windwp/nvim-ts-autotag" })
    -- LSP
    use({ "neovim/nvim-lspconfig" })                                                                           -- enable LSP
    use({ "williamboman/mason.nvim" })                                                                         -- simple to use language server installer
    use({ "williamboman/mason-lspconfig.nvim" })
    use({ "nvimtools/none-ls.nvim", requires = { "nvim-lua/plenary.nvim", "nvimtools/none-ls-extras.nvim" } }) -- for formatters and linters
    use({ "RRethy/vim-illuminate" })
    use({ "onsails/lspkind-nvim" })
    use({ "lervag/vimtex" })
    use({
        "hinell/lsp-timeout.nvim",
        requires = { "neovim/nvim-lspconfig" },
        setup = function()
            vim.g.lspTimeoutConfig = {
                stopTimeout = 1000 * 60 * 5, --     stopTimeout  = 1000 * 60 * 5,  -- ms, timeout before stopping all LSP servers
                startTimeout = 1000 * 10,    -- ms, timeout before restart
                silent = false,              -- true to suppress notifications
            }
        end,
    })

    -- Telescope
    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        requires = { { "nvim-lua/plenary.nvim" } },
    })
    -- Treesitter
    use({ "nvim-treesitter/nvim-treesitter" })

    -- Git
    use({ "lewis6991/gitsigns.nvim", commit = "2c6f96dda47e55fa07052ce2e2141e8367cbaaf2" })

    -- VimWithMe
    use({ "ThePrimeagen/vim-be-good" })

    -- magma (ipnyb)
    use({ "dccsillag/magma-nvim", run = ":UpdateRemotePlugins" })

    -- Markdown
    use({
        "ellisonleao/glow.nvim",
        config = function()
            require("glow").setup()
        end,
    })

    use({
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    })

    -- Discord presense
    -- use({ "IogaMaster/neocord" })

    use({ "rcarriga/nvim-notify" })
    use({ "MunifTanjim/nui.nvim" })
    use({ "grapp-dev/nui-components.nvim" })

    use({ "NvChad/nvim-colorizer.lua" })
    use({
        "Aityz/usage.nvim",
        config = function()
            require("usage").setup()
        end,
    })

    use({ "https://github.com/tpope/vim-dispatch" })

    use({ "kkharji/sqlite.lua" })


    -- SSH

    use {
        "nosduco/remote-sshfs.nvim",
        requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    }

    -- use({
    -- 	"/home/cv-rishi/Projects/UsageTracker",
    -- 	requires = { "kkharji/sqlite.lua" },
    -- 	config = function()
    -- 		require("usage-tracker").setup({
    -- 			save_interval = 60, -- Save data every 60 seconds
    -- 			data_file = vim.fn.stdpath("data") .. "/usage-tracker/usage.db",
    -- 			min_time_threshold = 5,
    -- 			use_sqlite = true,
    -- 		})
    -- 	end,
    -- })
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
