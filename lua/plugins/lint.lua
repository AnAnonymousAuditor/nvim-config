return {
    "mfussenegger/nvim-lint",
    enabled = false,
    config = function()
        local lint = require("lint")
        lint.linters_by_ft = {
            -- sh = {
            --     "shellcheck",
            -- },
        }
        vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave", "BufWritePost" }, {
            callback = function()
                lint.try_lint()
            end,
        })
    end,
}
