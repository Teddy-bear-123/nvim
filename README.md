# Neovim Config

<a href="https://dotfyle.com/Teddy-bear-123/nvim"><img src="https://dotfyle.com/Teddy-bear-123/nvim/badges/plugins?style=flat" /></a>
<a href="https://dotfyle.com/Teddy-bear-123/nvim"><img src="https://dotfyle.com/Teddy-bear-123/nvim/badges/leaderkey?style=flat" /></a>
<a href="https://dotfyle.com/Teddy-bear-123/nvim"><img src="https://dotfyle.com/Teddy-bear-123/nvim/badges/plugin-manager?style=flat" /></a>
### My personal Neovim Config

## Installation

### Prerequisites
- Neovim (Follow [this](https://github.com/neovim/neovim/releases/)) (note that for debian systems, apt doesn't have the latest one, use the AppImage/build from source/some other form)
- Node
- lazy git
- Nerdfonts

### Installing 

<details>
<summary>Already have a PreInstalled Neovim config</summary>

Create a backup of your current config (If you want to have a backup incase you want to go back)
```shell
# Linux / Macos (unix)
mkdir ~/.nvim_backup
cp ~/.config/nvim ~/.nvim_backup

# Windows (not sure)
```
Remove old config
```shell
# Linux / Macos (unix)
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim

# Windows
rd -r ~\AppData\Local\nvim
rd -r ~\AppData\Local\nvim-data
```
</details>
Clone the repository (make a backup your current `~/.config/nvim` directory if you want to keep it).  

> Install requires Neovim 0.9+. Always review the code before installing a configuration.
```shell
# Linux / Macos (unix)
git clone https://github.com/Teddy-bear-123/nvim.git ~/.config/nvim

# Windows
git clone https://github.com/NvChad/NvChad $HOME\AppData\Local\nvim 
```
Run `nvim` and wait for packer to install your plugins. 
### Highly inspired by:  
- [chris@machine](https://github.com/ChristianChiarulli) (more specifically [this](https://github.com/LunarVim/Neovim-from-scratch/tree/master))
- [ThePrimeagen](https://www.youtube.com/watch?v=w7i4amO_zaE&ab_channel=ThePrimeagen)
- [GhilesLarbi](https://github.com/GhilesLarbi/NeovimDots) (mostly for the [theme](https://www.reddit.com/r/unixporn/comments/16vxf0s/bspwm_im_a_simple_man_and_i_need_simple_stuff/))


## Plugins

### colorscheme

+ [folke/tokyonight.nvim](https://dotfyle.com/plugins/folke/tokyonight.nvim)
+ [rose-pine/neovim](https://dotfyle.com/plugins/rose-pine/neovim)
+ [Ayu-dark](https://github.com/Shatur/neovim-ayu)
+ [Dark+](https://github.com/lunarvim/darkplus.nvim")


### comment

+ [numToStr/Comment.nvim](https://dotfyle.com/plugins/numToStr/Comment.nvim)
+ [JoosepAlviste/nvim-ts-context-commentstring](https://dotfyle.com/plugins/JoosepAlviste/nvim-ts-context-commentstring)
### completion

+ [hrsh7th/nvim-cmp](https://dotfyle.com/plugins/hrsh7th/nvim-cmp)
### cursorline

+ [RRethy/vim-illuminate](https://dotfyle.com/plugins/RRethy/vim-illuminate)
### editing-support

+ [windwp/nvim-autopairs](https://dotfyle.com/plugins/windwp/nvim-autopairs)
+ [windwp/nvim-ts-autotag](https://dotfyle.com/plugins/windwp/nvim-ts-autotag)
### file-explorer

+ [kyazdani42/nvim-tree.lua](https://dotfyle.com/plugins/kyazdani42/nvim-tree.lua)
### fuzzy-finder

+ [nvim-telescope/telescope.nvim](https://dotfyle.com/plugins/nvim-telescope/telescope.nvim)
### game

+ [ThePrimeagen/vim-be-good](https://dotfyle.com/plugins/ThePrimeagen/vim-be-good)
### git

+ [lewis6991/gitsigns.nvim](https://dotfyle.com/plugins/lewis6991/gitsigns.nvim)
### icon

+ [kyazdani42/nvim-web-devicons](https://dotfyle.com/plugins/kyazdani42/nvim-web-devicons)
### indent

+ [lukas-reineke/indent-blankline.nvim](https://dotfyle.com/plugins/lukas-reineke/indent-blankline.nvim)
### keybinding

+ [folke/which-key.nvim](https://dotfyle.com/plugins/folke/which-key.nvim)
### lsp

+ [jose-elias-alvarez/null-ls.nvim](https://dotfyle.com/plugins/jose-elias-alvarez/null-ls.nvim)
+ [neovim/nvim-lspconfig](https://dotfyle.com/plugins/neovim/nvim-lspconfig)
### lsp-installer

+ [williamboman/mason.nvim](https://dotfyle.com/plugins/williamboman/mason.nvim)
### markdown-and-latex

+ [ellisonleao/glow.nvim](https://dotfyle.com/plugins/ellisonleao/glow.nvim)
+ [iamcco/markdown-preview.nvim](https://dotfyle.com/plugins/iamcco/markdown-preview.nvim)
### media

+ [andweeb/presence.nvim](https://dotfyle.com/plugins/andweeb/presence.nvim)
### nvim-dev

+ [nvim-lua/plenary.nvim](https://dotfyle.com/plugins/nvim-lua/plenary.nvim)
### plugin-manager

+ [wbthomason/packer.nvim](https://dotfyle.com/plugins/wbthomason/packer.nvim)
### project

+ [ahmedkhalf/project.nvim](https://dotfyle.com/plugins/ahmedkhalf/project.nvim)
### snippet

+ [L3MON4D3/LuaSnip](https://dotfyle.com/plugins/L3MON4D3/LuaSnip)
### startup

+ [goolord/alpha-nvim](https://dotfyle.com/plugins/goolord/alpha-nvim)
### statusline

+ [nvim-lualine/lualine.nvim](https://dotfyle.com/plugins/nvim-lualine/lualine.nvim)
### syntax

+ [nvim-treesitter/nvim-treesitter](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter)
### tabline

+ [akinsho/bufferline.nvim](https://dotfyle.com/plugins/akinsho/bufferline.nvim)
## Language Servers

+ bashls
+ cssls
+ efm
+ html
+ jsonls
+ lua_ls
+ pyright
+ tsserver
+ yamlls


 This readme was generated by [Dotfyle](https://dotfyle.com)
