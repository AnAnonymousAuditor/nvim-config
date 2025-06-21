require("config.lazy")

vim.cmd.colorscheme("fluoromachine")

vim.filetype.add({
    pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})

local augroup = vim.api.nvim_create_augroup
local manuelGroup = augroup("ManuelBotas", {})

local autocmd = vim.api.nvim_create_autocmd
local yankGroup = augroup("HighlightYank", {})

autocmd("TextYankPost", {
    group = yankGroup,
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 40,
        })
    end,
})

autocmd("BufWritePre", {
    group = manuelGroup,
    pattern = "*",
    callback = function()
        if vim.bo.ft == "gitcommit" then
            return
        elseif vim.bo.ft == "markdown" then
            vim.cmd([[%s/^\s\+$//e]])
        else
            vim.cmd([[%s/\s\+$//e]])
        end
    end,
})
