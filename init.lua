local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

vim.opt.messagesopt:append("maxheight:50,pager:<CR>,timeout:4000")

require('vim._core.ui2').enable({
    enable = true,
    msg = {
        targets = 'cmd',
        dialog = { height = 0.5 },
        msg = { height = 0.5 },
        pager = { height = 0.999 },
    },
})

require("config.options")
require("config.keymaps")
require("config.plugins")
require("config.after")
