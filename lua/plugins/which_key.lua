return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        expand = 1,
        keys = {
            scroll_down = "<S-C-D>",
            scroll_up = "<S-C-U>",
        },
        spec = {
            { "<leader>c", group = "[C]ode" },
            { "<leader>g", group = "[G]oto" },
            { "<leader>h", group = "[H]arpoon" },
            { "<leader>s", group = "[S]earch" },
        },
    },
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = false })
            end,
            desc = "Buffer Local Keymaps (which-key)",
        },
    },
}
