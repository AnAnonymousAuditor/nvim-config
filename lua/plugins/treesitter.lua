return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    opts = {
        install_dir = vim.fn.stdpath("data") .. "/site",
    },
    config = function()
        local ts = require("nvim-treesitter")
        local group = vim.api.nvim_create_augroup("custom-treesitter", { clear = true })
        local ensure_install = {
            "javascript",
            "java",
            "python",
            "c",
            "lua",
            "vim",
            "vimdoc",
            "query",
        }
        ts.install(ensure_install)

        -- Snippet yoinked from https://github.com/tjdevries/config.nvim/blob/7cad8009177b4c10083b21cfa14f8eebe308745e/lua/custom/treesitter.lua
        -- local syntax_on = {}
        vim.api.nvim_create_autocmd("FileType", {
            group = group,
            callback = function(args)
                local bufnr = args.buf
                local ok, parser = pcall(vim.treesitter.get_parser, bufnr)
                if not ok or not parser then
                    return
                end
                pcall(vim.treesitter.start)

                -- local ft = vim.bo[bufnr].filetype
                -- if syntax_on[ft] then
                --     vim.bo[bufnr].syntax = "on"
                -- end
            end,
        })
    end,
}
