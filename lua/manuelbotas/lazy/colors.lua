return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
    },

    "almo7aya/neogruvbox.nvim",
    {
        "sainnhe/gruvbox-material",
        lazy = false,
        priority = 1000,
        config = function()
            local g = vim.g
            g.gruvbox_material_background = "medium"
            g.gruvbox_material_foreground = "material"
            g.gruvbox_material_enable_bold = true
            g.gruvbox_material_statusline_style = "default"
        end,
    },

    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = true,
        opts = ...,
    },
}
