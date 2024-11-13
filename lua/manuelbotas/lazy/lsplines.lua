return {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
        require("lsp_lines").setup()

        --[[ vim.diagnostic.config({ virtual_lines = false })
        vim.keymap.set(
            "",
            "<Leader>l",
            function ()
                local vtext = vim.diagnostic.config().virtual_text
                if vtext then
                    vim.diagnostic.config({ virtual_text = false})
                else
                    vim.diagnostic.config({ virtual_text = true})
                end
                require("lsp_lines").toggle()
            end,
            { desc = "Toggle lsp lines" }
        ) ]]

        vim.diagnostic.config({ virtual_lines = { only_current_line = true } })
        vim.keymap.set("", "<Leader>l", function()
            local vlines = vim.diagnostic.config().virtual_lines
            if vlines == true then
                vim.diagnostic.config({
                    virtual_lines = { only_current_line = true },
                    virtual_text = true,
                })
            else
                vim.diagnostic.config({
                    virtual_lines = true,
                    virtual_text = false,
                })
            end
        end, { desc = "Toggle lsp lines" })
    end,
}
