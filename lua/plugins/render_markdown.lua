return {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        completions = {
            blink = { enabled = true },
        },
        code = {
            disable_background = true,
            width = "block",
            left_pad = 1,
            language_border = " ",
            language_left = "",
            language_right = "",
        },
    },
}
