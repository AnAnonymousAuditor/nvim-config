return {
    "chomosuke/typst-preview.nvim",
    ft = "typst",
    version = "1.*",
    opts = {
        dependencies_bin = {
            ["tinymist"] = "tinymist",
        },
        invert_colors = '{"rest": "auto","image": "never"}',
    },
}
