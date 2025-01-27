vim.g.copilot_assume_mapped = true

vim.g.copilot_no_tab_map = true

vim.api.nvim_set_keymap("i", "<C-e>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
--
--
--
-- insane config ik ik 

-- require("supermaven-nvim").setup({
--   keymaps = {
--     accept_suggestion = "<C-e>",
--     clear_suggestion = "<C-]>",
--     accept_word = "<C-j>",
--   },
--   color = {
--     suggestion_color = "#ffffff",
--     cterm = 244,
--   },
--   log_level = "info", -- set to "off" to disable logging completely
--   disable_inline_completion = false, -- disables inline completion for use with cmp
--   disable_keymaps = false -- disables built in keymaps for more manual control
-- })
