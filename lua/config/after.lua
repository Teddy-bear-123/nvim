require "mason".setup()
require "mini.pick".setup()
require "mini.bufremove".setup()
require "oil".setup()


local lsps = {
    -- Lua
    "lua_ls",

    -- C / C++
    "clangd",

    -- Rust
    "rust_analyzer",

    -- Go
    "gopls",

    -- C3
    -- "c3_lsp",

    -- Python
    "pyright",
    "ruff",

    -- Javascript


    -- Typstscript
    -- "ts_ls",

    -- Typst
    "prettypst",
    "tinymist",

    -- LaTeX
    -- "tectonic",
    "texlab",
    "latexindent",

    -- English / Grammar
    "harper_ls"

    -- Others
    -- "denols",
    -- "omnisharp",
    -- "jdtls",
    -- "pgformatter",
    -- "sqlls",
    -- "htmx",
    -- "cssls",
}

local lspconfig = require("lspconfig")

-- vim.lsp.config("gdscript", { -- godot, gdscript
--     cmd = vim.lsp.rpc.connect("127.0.0.1", 6005),
--     filetypes = { "gdscript", "gd", "gdscript3" },
-- })
-- vim.lsp.enable("gdscript")


vim.lsp.enable(lsps)

vim.filetype.add({
    extension = {
        c3 = "c3",
        c3i = "c3",
        c3t = "c3",
        mdx = "markdown",
    },
});



-- local parser_config = require "nvim-treesitter.parsers".get_parser_configs() -- c3 C3 c-3
-- parser_config.c3 = {
--     install_info = {
--         url = "https://github.com/c3lang/tree-sitter-c3",
--         files = { "src/parser.c", "src/scanner.c" },
--         branch = "main",
--     },
--     filetype = "c3",
--     sync_install = true, -- Set to true if you want to install synchronously
--     auto_install = true, -- Automatically install when opening a file
-- }


-- require('nvim-treesitter.configs').setup({
--     highlight = { enable = true, },
--     ensure_installed = { "lua", "vim", "vimdoc", "python", "javascript", "typescript", "rust", "c", "cpp", "c3" },
--     auto_install = true,
--     sync_install = true,
--     modules = {},
--     ignore_install = {},
--     install_dir = "",
-- })

local telescope = require("telescope")
local open_with_trouble = require("trouble.sources.telescope").open

telescope.setup({
    defaults = {
        mappings = {
            i = { ["<c-t>"] = open_with_trouble },
            n = { ["<c-t>"] = open_with_trouble },
        },
    },
})

vim.cmd.colorscheme("ayu-dark")

local function set_custom_highlights()
    local brighter_guide = "#4B5263" -- changed `LineNr` to be brigher
    vim.api.nvim_set_hl(0, "LineNr", { fg = brighter_guide })
end

set_custom_highlights()

vim.cmd("highlight EndOfBuffer guibg=bg guifg=bg")
