require "mason".setup()
require "mini.pick".setup()
require "mini.bufremove".setup()
require "oil".setup()


local lsps = {
    "lua_ls", "clangd", "rust_analyzer", "gopls", "pyright", "ruff", "tinymist", "typstyle", "texlab", "harper_ls"
    -- C3
    -- "c3_lsp",
    -- "ts_ls",
    -- "tectonic",
    -- "latexindent",
    -- "denols",
    -- "omnisharp",
    -- "jdtls",
    -- "pgformatter",
    -- "sqlls",
    -- "htmx",
    -- "cssls",
}



vim.diagnostic.config({
    virtual_text = {
        format = function(diagnostic)
            if diagnostic.source == "Harper" then
                return nil
            end
            return diagnostic.message
        end,
        jump = {
            severity = vim.diagnostic.severity.ERROR,
            wrap = true,
            on_jump = function(diagnostic, bufnr)
                vim.diagnostic.open_float()
            end,
        },
    },
})

require("lspconfig")

local capabilities = vim.lsp.protocol.make_client_capabilities()



vim.lsp.config("*", { capabilities = capabilities })

vim.lsp.enable(lsps)

vim.filetype.add({
    extension = {
        c3 = "c3",
        c3i = "c3",
        c3t = "c3",
        mdx = "markdown",
    },
});


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


-- vim.lsp.config("gdscript", { -- godot, gdscript
--     cmd = vim.lsp.rpc.connect("127.0.0.1", 6005),
--     filetypes = { "gdscript", "gd", "gdscript3" },
-- })
-- vim.lsp.enable("gdscript")

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
