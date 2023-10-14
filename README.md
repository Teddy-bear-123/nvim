# Neovim Config

### My personal Neovim Config

## Installation

### Prerequisites
- Neovim (Follow [this](https://github.com/neovim/neovim/releases/)) (note that for debian systems, 'apt' has version 0.7, while 0.9 is the latest. Use the AppImage/build from source/some other form)
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

```shell
# Linux / Macos (unix)
git clone https://github.com/Teddy-bear-123/nvim.git ~/.config/nvim

# Windows
git clone https://github.com/Teddy-bear-123/nvim.git $HOME\AppData\Local\nvim 
```
Run `nvim` and wait for packer to install your plugins. 
### Highly inspired by:  
- [chris@machine](https://github.com/ChristianChiarulli) (more specifically [this](https://github.com/LunarVim/Neovim-from-scratch/tree/master))
- [ThePrimeagen](https://www.youtube.com/watch?v=w7i4amO_zaE&ab_channel=ThePrimeagen)
- [GhilesLarbi](https://github.com/GhilesLarbi/NeovimDots) (mostly for the [theme](https://www.reddit.com/r/unixporn/comments/16vxf0s/bspwm_im_a_simple_man_and_i_need_simple_stuff/))
