return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    keys = {
        { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Search TODO Comments" },
        { "{t", "<cmd>lua require('todo-comments').jump_prev()<cr>", desc = "Previous TODO Comment" },
        { "}t", "<cmd>lua require('todo-comments').jump_next()<cr>", desc = "Next TODO Comment" },
    },
    opts = {},
}
