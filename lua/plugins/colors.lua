return {
    {
        "xiyaowong/transparent.nvim",
        lazy = false,
        opts = {
            extra_groups = {
                "NormalFloat",
            },
        },
    },

    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
    },

    {
        "maxmx03/fluoromachine.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            -- glow = false,
            theme = "retrowave",
            transparent = true,
        },
    },
}
