return {
	filetypes = { "matlab" },
	root_dir = require("lspconfig.util").root_pattern(".git", "*.prj"),
	settings = {
		matlab = {
			indexWorkspace = true, -- Disable indexing workspace for faster performance
			telemetry = false, -- Disable telemetry
			lint = {
				enable = true, -- Enable linting
				severity = {
					unusedVariable = "warning",
					syntaxError = "error",
				},
			},
		},
	},
}
