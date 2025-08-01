local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable", -- latest stable release
        lazyrepo,
        lazypath,
    })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require("config.set")
require("config.remap")

require("lazy").setup({
    spec = "plugins",
    install = {
        colorscheme = { "fluoromachine" },
    },
    checker = {
        enabled = true,
        notify = false,
    },
    change_detection = { notify = false },
    performance = {
        rtp = { reset = false },
    },
    ui = {
        border = "rounded",
        icons = {
            plugin = " ",
        },
    },
})
