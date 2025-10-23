---@brief
---
--- https://github.com/microsoft/pyright
---
--- `pyright`, a static type checker and language server for python
local function set_python_path(command)
	local path = command.args
	local clients = vim.lsp.get_clients {
		bufnr = vim.api.nvim_get_current_buf(),
		name = 'pyright',
	}
	for _, client in ipairs(clients) do
		if client.settings then
			client.settings.python = vim.tbl_deep_extend('force', client.settings.python, { pythonPath = path })
		else
			client.config.settings = vim.tbl_deep_extend('force', client.config.settings, { python = { pythonPath = path } })
		end
		client:notify('workspace/didChangeConfiguration', { settings = nil })
	end
end

local function get_python_path()
	local handle = io.popen('pyenv which python 2>/dev/null')
	if handle then
		local result = handle:read("*a")
		handle:close()
		if result and result:match("^/") then
			return result:gsub("%s+", "")
		end
	end

	local handle2 = io.popen('which python3 2>/dev/null || which python 2>/dev/null')
	if handle2 then
		local result = handle2:read("*a")
		handle2:close()
		if result and result:match("^/") then
			return result:gsub("%s+", "")
		end
	end

	return "python"
end


---@type vim.lsp.ClientConfig
vim.lsp.config("pyright", {
	cmd = { 'pyright-langserver', '--stdio' },
	filetypes = { 'python' },
	settings = {
		python = {
			pythonPath = get_python_path(),
			analysis = {
				diagnosticMode = "workspace",
				typeCheckingMode = "basic",
				reportMissingImports = false,
				reportMissingTypeStubs = false,
				reportUnusedImport = false,
				reportUnusedVariable = false,
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
				autoImportCompletions = true,
			},
		},
	},
	on_attach = function(client, bufnr)
		print("Current Python Path is -", client.config.settings.python.pythonPath)
		vim.api.nvim_buf_create_user_command(bufnr, 'OrganizeImports', function()
			local params = {
				command = 'pyright.organizeimports',
				arguments = { vim.uri_from_bufnr(bufnr) },
			}
			client.request('workspace/executeCommand', params, nil, bufnr)
		end, {
			desc = 'Organize Imports',
		})
		vim.api.nvim_buf_create_user_command(bufnr, 'SetPythonPath', set_python_path, {
			desc = 'Reconfigure pyright with the provided python path',
			nargs = 1,
			complete = 'file',
		})
		vim.api.nvim_buf_create_user_command(bufnr, 'RefreshPythonPath', function()
			local new_path = get_python_path()
			if client.settings then
				client.settings.python.pythonPath = new_path
			else
				client.config.settings.python.pythonPath = new_path
			end
			client:notify('workspace/didChangeConfiguration', { settings = nil })
			print("Pyright Python path updated to:", new_path)
		end, {
			desc = 'Refresh Pyright Python path from current environment',
		})
	end,
})
