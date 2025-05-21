require("manuelbotas.set")
require("manuelbotas.remap")
require("manuelbotas.lazy_init")

vim.cmd.colorscheme("fluoromachine")

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

autocmd("LspAttach", {
    group = manuelGroup,
    desc = "LSP actions",
    callback = function(event)
        local ts_builtin = require("telescope.builtin")
        local lspmap = function(keys, func, desc, mode)
            mode = mode or "n"
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end
        lspmap("<leader>gr", ts_builtin.lsp_references, "Goto references")
        lspmap("<leader>gi", ts_builtin.lsp_implementations, "Goto implementations")
        lspmap("<leader>gd", ts_builtin.lsp_definitions, "Goto definition")
        lspmap("<leader>gD", vim.lsp.buf.declaration, "Goto declaration")
        lspmap("<leader>cd", ts_builtin.diagnostics, "List diagnostics")
        lspmap("<leader>cs", ts_builtin.lsp_document_symbols, "List document symbols")
        lspmap("<leader>cw", ts_builtin.lsp_dynamic_workspace_symbols, "List workspace symbols")
        lspmap("<leader>ca", vim.lsp.buf.code_action, "Select code action")
        lspmap("<leader>cr", vim.lsp.buf.rename, "Rename symbol")
        -- lspmap("<C-h>", vim.lsp.buf.signature_help, "Signature help", "i")
        -- lspmap("K", vim.lsp.buf.hover, "Symbol info (hover)")
        lspmap("{d", function()
            vim.diagnostic.jump({ count = -1, float = true })
        end, "Previous diagnostic")
        lspmap("}d", function()
            vim.diagnostic.jump({ count = 1, float = true })
        end, "Next diagnostic")
    end,
})
