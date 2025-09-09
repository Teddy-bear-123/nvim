#nvim config stuff i will move to later (use the new-11-lazy branch for now) (For v.12 nightly, breaks way to often + need to get ayu-dark working!)




## kainda important stuff

1.. Download LSP configurations:
```bash
cd ~/.config/nvim
git clone https://github.com/neovim/nvim-lspconfig.git
cd nvim-lspconfig
mv lsp ..
rm nvim-lspconfig -rf
```

( a lazy way to get a config for every lsp that I might update once in a while? porbably not worth it IMO but like ehhhh)


## Structure

```
~/.config/nvim/
├── init.lua   
├── lua/config/
│   ├── options
│   ├── keymaps
│   ├── after.lua
│   └── plugins
├── lsp/       
└── README.md  
```

Credit to [sylvan franklin](https://github.com/SylvanFranklin/.config/blob/main/nvim/init.lua)
