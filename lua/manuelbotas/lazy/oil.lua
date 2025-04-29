return {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    opts = {
        view_options = {
            show_hidden = true,
        },
    },
    init = function()
        vim.keymap.set("n", "<leader>o", vim.cmd.Oil, { desc = "Oil" })
    end,
}
