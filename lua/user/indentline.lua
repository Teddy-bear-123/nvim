local status_ok, ibl = pcall(require, "ibl")
if not status_ok then
	return
end

ibl.setup({
	indent = {
		char = "▏", -- your indent char
	},
	exclude = {
		filetypes = {
			"help",
			"startify",
			"dashboard",
			"packer",
			"neogitstatus",
			"NvimTree",
			"Trouble",
		},
		buftypes = { "terminal", "nofile" },
	},
	scope = {
		enabled = true, -- show current context
		show_start = false,
		highlight = { "IndentBlanklineContextChar" },
		include = {
			node_type = {
				["*"] = {
					"class",
					"return",
					"function",
					"method",
					"^if",
					"^while",
					"jsx_element",
					"^for",
					"^object",
					"^table",
					"block",
					"arguments",
					"if_statement",
					"else_clause",
					"jsx_element",
					"jsx_self_closing_element",
					"try_statement",
					"catch_clause",
					"import_statement",
					"operation_type",
				},
			},
		},
	},
})

-- vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]
-- vim.opt.list = true
-- vim.opt.listchars:append "space:⋅"
-- vim.opt.listchars:append "space:"
-- vim.opt.listchars:append "eol:↴"
