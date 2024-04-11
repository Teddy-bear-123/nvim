local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    print("null-ls not found")
    return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
    debug = true,
    sources = {
        formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
        formatting.black.with({ extra_args = { "--fast" } }),
        formatting.stylua,
        formatting.eslint_d,
        formatting.autoflake,
        formatting.biome,
        formatting.markdownlint,
        -- formatting.clang_format.with({extra_args = { "-style=file:~/.config/.clang_format" },}),
        require('none-ls.diagnostics.flake8').with {
        extra_args = {
          '--max-line-length=88',
          "--ignore=E501, W503, W605",
        },
      },
    },
})
