require("manuelbotas.set")
require("manuelbotas.remap")
require("manuelbotas.lazy_init")

vim.cmd.colorscheme("gruvbox-material")

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
        if vim.bo.ft == "markdown" then
            vim.cmd([[%s/^\s\+$//e]])
        else
            vim.cmd([[%s/\s\+$//e]])
        end
    end,
})

autocmd("LspAttach", {
    group = manuelGroup,
    desc = "LSP actions",
    callback = function(event)
        local opts = { buffer = event.buf }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
        vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
        vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "}d", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "{d", vim.diagnostic.goto_prev, opts)
    end,
})
