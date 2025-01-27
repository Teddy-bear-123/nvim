local opts = {
    settings = {
        ["rust-analyzer"] = {
            cargo = {
                allFeatures = true,
            },
            procMacro = {
                enable = true,
            },
            checkOnSave = {
                command = "clippy",
            },
            -- Configure auto-imports
            assist = {
                importGranularity = "module", -- Use 'module' for auto imports
            },
            -- Configure diagnostics
            diagnostics = {
                disabled = { "non_snake_case" }, -- Ignore 'non_snake_case' diagnostics
            },
        },
    },
}

return opts

