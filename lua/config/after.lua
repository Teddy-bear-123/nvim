-- Plugin configurations
require "mason".setup()
require "mini.pick".setup()
require "oil".setup()

vim.lsp.enable({ "lua_ls", "jdtls", "clangd" })

require('nvim-treesitter.configs').setup({
	highlight = { enable = true, },
})

-- Color scheme stuff, decided to live with ayu at some point so im still here

vim.cmd.colorscheme("ayu-dark")

local function set_custom_highlights()
	local brighter_guide = "#4B5263" -- changed `LineNr` to be brigher
	vim.api.nvim_set_hl(0, "LineNr", { fg = brighter_guide })
end

set_custom_highlights()

-- Hide end-of-buffer markers
vim.cmd("highlight EndOfBuffer guibg=bg guifg=bg")
