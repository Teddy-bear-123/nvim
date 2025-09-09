# nvim config stuff i kainda used (for v.11+ (should work?) and with lazy )




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
