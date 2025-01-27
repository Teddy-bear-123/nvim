local colorscheme = "ayu-dark"

-- Load the colorscheme and handle errors
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end

-- Use the colors from the `ayu` theme to set custom highlights
local colors = require("ayu.colors") -- Ensure you have `ayu` plugin installed

-- Function to override highlight groups
local function set_custom_highlights()
	local brighter_guide = "#4B5263" -- Brighter alternative for `LineNr`
	vim.api.nvim_set_hl(0, "LineNr", { fg = brighter_guide })
end

-- Apply custom highlights
set_custom_highlights()

-- Hide end-of-buffer markers
vim.cmd("highlight EndOfBuffer guibg=bg guifg=bg")
