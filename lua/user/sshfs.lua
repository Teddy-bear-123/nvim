local function safe_require(name)
    local ok, mod = pcall(require, name)
    if not ok then
        vim.notify(
            ("⚠️ Failed to load %s: %s"):format(name, tostring(mod)),
            vim.log.levels.ERROR,
            { title = "Plugin Error" }
        )
        return nil
    end
    return mod
end

local rs = safe_require("remote-sshfs")

if not rs then
    return
end
local cfg = {
    connections = {
        ssh_configs = { vim.fn.expand("$HOME/.ssh/config") },
        sshfs_args = {
            "-o reconnect",
            "-o ConnectTimeout=5",
            "-o ServerAliveInterval=15",
            "-o Ciphers=aes128-ctr",
            "-o Compression=no",
            "-o cache=yes",
            "-o cache_timeout=600",
            "-o kernel_cache",
            "-o max_conns=4"
            -- add more of your options if needed, e.g.: "-o Ciphers=aes128-ctr"
        },
    },
    mounts = {
        base_dir = vim.fn.expand("$HOME/.sshfs/"),
        unmount_on_exit = true,
    },
    handlers = {
        on_connect = { change_dir = true },
        on_disconnect = { clean_mount_folders = false },
    },
    ui = { confirm = { connect = true, change_dir = false } },
    log = { enabled = false },
}

require("remote-sshfs").setup(cfg)
require("telescope").load_extension("remote-sshfs")
