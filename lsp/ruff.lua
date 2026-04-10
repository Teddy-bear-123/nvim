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

-- local function ruff_cmd()
--     local ok = vim.fn.system({ "ruff", "--version" })
--     if vim.v.shell_error == 0 then
--         return { "ruff", "server" }
--     end
--     return { "uv", "run", "ruff", "server" }
-- end
--
-- ---@type vim.lsp.ClientConfig
-- vim.lsp.config("ruff", {
--     cmd = ruff_cmd(),
--     filetypes = { 'python' },
--     -- root_markers = { 'pyproject.toml', 'ruff.toml', '.ruff.toml', '.git' },
--     settings = {
--         lint = {
--             enable = true,
--             args = {
--                 "--line-length=88",
--                 "--select=E,W,F,I,N,UP,YTT,ANN,S,BLE,FBT,B,A,COM,C4,DTZ,T10,EM,EXE,ISC,ICN,G,INP,PIE,T20,PT,Q,RSE,RET,SLF,SIM,TID,TCH,ARG,PTH,ERA,PD,PGH,PL,TRY,NPY,RUF",
--                 "--ignore=E501,W503,W605,E203"
--             }
--         },
--         format = {
--             enable = true,
--             args = {
--                 "--line-length88"
--             }
--         }
--     }
-- })




local function ruff_cmd()
    local result = vim.fn.system({ "ruff", "--version" })

    -- If command succeeded, use it
    if vim.v.shell_error == 0 then
        return { "ruff", "server" }
    end

    -- Detect pyenv shim error
    if result:match("pyenv: ruff: command not found") then
        return { "uv", "run", "ruff", "server" }
    end

    -- Fallback (just in case)
    return { "ruff", "server" }
end


---@type vim.lsp.Config
return {
    cmd = ruff_cmd(),
    filetypes = { 'python' },
    -- root_markers = { 'pyproject.toml', 'ruff.toml', '.ruff.toml', '.git' },
    settings = {},
}
