---@brief
---
--- https://github.com/astral-sh/ruff
---
--- A Language Server Protocol implementation for Ruff, an extremely fast Python linter and code formatter, written in Rust. It can be installed via `pip`.
---
--- ```sh
--- pip install ruff
--- ```
---
--- **Available in Ruff `v0.4.5` in beta and stabilized in Ruff `v0.5.3`.**
---
--- This is the new built-in language server written in Rust. It supports the same feature set as `ruff-lsp`, but with superior performance and no installation required. Note that the `ruff-lsp` server will continue to be maintained until further notice.
---
--- Server settings can be provided via:
---
--- ```lua
--- vim.lsp.config('ruff', {
---   init_options = {
---     settings = {
---       -- Server settings should go here
---     }
---   }
--- })
--- ```
---
--- Refer to the [documentation](https://docs.astral.sh/ruff/editors/) for more details.


---@type vim.lsp.ClientConfig
vim.lsp.config("ruff", {
	cmd = { 'ruff', 'server' },
	filetypes = { 'python' },
	-- root_markers = { 'pyproject.toml', 'ruff.toml', '.ruff.toml', '.git' },
	settings = {
		lint = {
			enable = true,
			args = {
				"--line-length=99",
				"--select=E,W,F,I,N,UP,YTT,ANN,S,BLE,FBT,B,A,COM,C4,DTZ,T10,EM,EXE,ISC,ICN,G,INP,PIE,T20,PT,Q,RSE,RET,SLF,SIM,TID,TCH,ARG,PTH,ERA,PD,PGH,PL,TRY,NPY,RUF",
				"--ignore=E501,W503,W605,E203"
			}
		},
		format = {
			enable = true,
			args = {
				"--line-length=99"
			}
		}
	}
})
