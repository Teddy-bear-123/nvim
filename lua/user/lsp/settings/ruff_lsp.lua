-- user/lsp/settings/ruff_lsp.lua

return {
    cmd = { 'ruff-lsp' },
    filetypes = { 'ruff' },
    root_dir = require('lspconfig.util').root_pattern('ruff.toml'),
    settings = {
        ruff = {
        enable = true,
        lint = {
            enable = true,
            onOpen = true,
            onSave = true,
        },
        format = {
            enable = true,
            onOpen = true,
            onSave = true,
        },
        },
    },
}
