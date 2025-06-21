vim.g.mapleader = " "
vim.g.maplocalleader = "-"

vim.opt.guicursor = ""

vim.o.number = true
vim.o.relativenumber = true

vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.smartindent = true

vim.o.wrap = false

vim.o.showmode = false

vim.o.swapfile = false
vim.o.backup = false
vim.o.undofile = true

vim.o.splitright = true

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false
vim.o.incsearch = true

vim.o.termguicolors = true
vim.g.have_nerd_font = true

vim.o.scrolloff = 8
vim.o.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.o.updatetime = 250

vim.o.winborder = "rounded"

vim.o.confirm = true

-- Set WSL Clipboard if in WSL
if vim.fn.has("wsl") == 1 then
    vim.g.clipboard = {
        name = "WslClipboard",
        copy = {
            ["+"] = "clip.exe",
            ["*"] = "clip.exe",
        },
        paste = {
            ["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
            ["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
        },
        cache_enabled = 0,
    }
end
