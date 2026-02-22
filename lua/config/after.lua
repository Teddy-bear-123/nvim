require "mason".setup()
require "mini.pick".setup()
require "mini.bufremove".setup()
require "oil".setup()


local lsps = {
    "lua_ls",
    "clangd",
    "ruff",
    "pyright",
    "prettypst",
    "tinymist",
    "rust_analyzer",
    -- "denols",
    "ts_ls",
    "tectonic",
    "omnisharp",
    "jdtls",
    "pgformatter",
    "sqlls",
    "htmx",
    "cssls",
    "c3_lsp",
    "texlab",
    "biome",
    "html",
    "gopls",
}

local lspconfig = require("lspconfig")

vim.lsp.config("gdscript", {
    cmd = vim.lsp.rpc.connect("127.0.0.1", 6005),
    filetypes = { "gdscript", "gd", "gdscript3" },
})
vim.lsp.enable("gdscript")


vim.lsp.enable(lsps)

vim.filetype.add({
    extension = {
        c3 = "c3",
        c3i = "c3",
        c3t = "c3",
        mdx = "markdown",
    },
});



local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.c3 = {
    install_info = {
        url = "https://github.com/c3lang/tree-sitter-c3",
        files = { "src/parser.c", "src/scanner.c" },
        branch = "main",
    },
    filetype = "c3",
    sync_install = true, -- Set to true if you want to install synchronously
    auto_install = true, -- Automatically install when opening a file
}


require('nvim-treesitter.configs').setup({
    highlight = { enable = true, },
    ensure_installed = { "lua", "vim", "vimdoc", "python", "javascript", "typescript", "rust", "c", "cpp", "c3" },
    auto_install = true,
    sync_install = true,
    modules = {},
    ignore_install = {},
    install_dir = "",
})





vim.cmd.colorscheme("ayu-dark")

local function set_custom_highlights()
    local brighter_guide = "#4B5263" -- changed `LineNr` to be brigher
    vim.api.nvim_set_hl(0, "LineNr", { fg = brighter_guide })
end

set_custom_highlights()

vim.cmd("highlight EndOfBuffer guibg=bg guifg=bg")
