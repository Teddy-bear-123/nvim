-- Set leader key
vim.g.mapleader = " "

-- General options
vim.cmd([[set mouse=]])
vim.opt.winborder = "rounded"
vim.opt.hlsearch = false
vim.opt.tabstop = 2
vim.opt.cursorcolumn = false
vim.opt.ignorecase = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.signcolumn = "yes"
vim.opt.clipboard = "unnamedplus"
vim.opt.swapfile = false
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.pumheight = 10

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('my.lsp', {}),
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        if client:supports_method('textDocument/completion') then
            -- Set omnifunc here
            vim.bo[args.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
            -- Optional: trigger autocompletion on EVERY keypress
            local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
            client.server_capabilities.completionProvider.triggerCharacters = chars
            vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
        end
    end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.api.nvim_set_hl(0, "Pmenu", { bg = "#2D3142", fg = "#CBCCC6" })
    vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#E9C46A", fg = "#2D3142", bold = true })
    vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#4F5B66" })
    vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#CBCCC6" })
  end,
})

