return {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "neovim/nvim-lspconfig",
        "j-hui/fidget.nvim",
        "saghen/blink.cmp",
    },
    config = function()
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
            desc = "LSP actions",
            callback = function(event)
                local ts_builtin = require("telescope.builtin")
                local lspmap = function(keys, func, desc, mode)
                    mode = mode or "n"
                    vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
                end
                lspmap("<leader>gr", ts_builtin.lsp_references, "Goto references")
                lspmap("<leader>gi", ts_builtin.lsp_implementations, "Goto implementations")
                lspmap("<leader>gt", ts_builtin.lsp_type_definitions, "Goto type definition")
                lspmap("<leader>gd", ts_builtin.lsp_definitions, "Goto definition")
                lspmap("<leader>gD", vim.lsp.buf.declaration, "Goto declaration")
                lspmap("<leader>cd", ts_builtin.diagnostics, "List diagnostics")
                lspmap("<leader>cs", ts_builtin.lsp_document_symbols, "List document symbols")
                lspmap("<leader>cw", ts_builtin.lsp_dynamic_workspace_symbols, "List workspace symbols")
                lspmap("<leader>ca", vim.lsp.buf.code_action, "Select code action")
                lspmap("<leader>cr", vim.lsp.buf.rename, "Rename symbol")
                lspmap("{d", function()
                    vim.diagnostic.jump({ count = -1, float = true })
                end, "Previous diagnostic")
                lspmap("}d", function()
                    vim.diagnostic.jump({ count = 1, float = true })
                end, "Next diagnostic")

                local function client_supports_method(client, method, bufnr)
                    if vim.fn.has("nvim-0.11") == 1 then
                        return client:supports_method(method, bufnr)
                    else
                        return client.supports_method(method, { bufnr = bufnr })
                    end
                end
                local client = vim.lsp.get_client_by_id(event.data.client_id)
                -- stylua: ignore
                if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
                    local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
                    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                        buffer = event.buf,
                        group = highlight_augroup,
                        callback = vim.lsp.buf.document_highlight,
                    })

                    vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                        buffer = event.buf,
                        group = highlight_augroup,
                        callback = vim.lsp.buf.clear_references,
                    })

                    vim.api.nvim_create_autocmd("LspDetach", {
                        group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
                        callback = function(event2)
                            vim.lsp.buf.clear_references()
                            vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
                        end,
                    })
                end

                -- stylua: ignore
                if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
                    lspmap("<leader>ch", function ()
                        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
                    end, "Toggle Inlay Hints")
                end
            end,
        })

        vim.diagnostic.config({
            severity_sort = true,
            float = {
                source = "if_many",
            },
            underline = { severity = vim.diagnostic.severity.ERROR },
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = "󰅚 ",
                    [vim.diagnostic.severity.WARN] = "󰀪 ",
                    [vim.diagnostic.severity.INFO] = "󰋽 ",
                    [vim.diagnostic.severity.HINT] = "󰌶 ",
                },
            },
            virtual_text = {
                source = "if_many",
                spacing = 2,
                format = function(diagnostic)
                    local diagnostic_message = {
                        [vim.diagnostic.severity.ERROR] = diagnostic.message,
                        [vim.diagnostic.severity.WARN] = diagnostic.message,
                        [vim.diagnostic.severity.INFO] = diagnostic.message,
                        [vim.diagnostic.severity.HINT] = diagnostic.message,
                    }
                    return diagnostic_message[diagnostic.severity]
                end,
            },
        })

        ---@class LspServersConfig
        ---@field mason table<string, vim.lsp.Config>
        ---@field other table<string, vim.lsp.Config>
        local servers = {
            mason = {
                asm_lsp = {},
                bashls = {
                    filetypes = { "bash", "sh", "zsh" },
                },
                clangd = {},
                cssls = {},
                gopls = {},
                hyprls = {},
                jsonls = {},
                lua_ls = {},
                r_language_server = {},
                taplo = {},
                tinymist = {},
            },
            other = {},
        }

        local ensure_installed = vim.tbl_keys(servers.mason or {})
        vim.list_extend(ensure_installed, {
            "shellcheck",
            "shfmt",
            "stylua",
        })
        require("mason-tool-installer").setup({
            ensure_installed = ensure_installed,
            -- auto_update = true,
        })

        for server, config in pairs(vim.tbl_extend("keep", servers.mason, servers.other)) do
            if not vim.tbl_isempty(config) then
                vim.lsp.config(server, config)
            end
        end

        require("mason-lspconfig").setup({
            ensure_installed = {},
            automatic_enable = true,
        })

        if not vim.tbl_isempty(servers.other) then
            vim.lsp.enable(vim.tbl_keys(servers.other))
        end
    end,
}
