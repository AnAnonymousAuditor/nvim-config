return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>f",
            function()
                require("conform").format({ async = true })
            end,
            mode = "",
            desc = "Format buffer",
        },
    },
    opts = {
        -- Set this to change the default values when calling conform.format()
        -- This will also affect the default values for format_on_save/format_after_save
        default_format_opts = {
            lsp_format = "fallback",
        },
        formatters_by_ft = {
            lua = { "stylua" },
            -- sh = { "shfmt" },
            -- zsh = { "shfmt" },
            markdown = { "injected" },
            -- python = { "isort", "black" },
            -- javascript = { { "prettierd", "prettier" } },
        },
        -- Set up format-on-save
        -- format_on_save = { timeout_ms = 500, lsp_fallback = true },
        formatters = {
            -- shfmt = {
            --     prepend_args = { "-i", "4" },
            -- },
            stylua = {
                prepend_args = { "--indent-type", "Spaces" },
            },
        },
    },
    init = function()
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
}
