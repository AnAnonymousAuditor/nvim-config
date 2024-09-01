return {
    "lervag/vimtex",
    lazy = false,
    init = function()
        -- VimTeX configuration goes here, e.g.
        vim.g.vimtex_view_method = "zathura_simple"
        -- vim.g.vimtex_compiler_method = "tectonic"
        -- vim.g.vimtex_compiler_tectonic = {
        --     out_dir = "",
        --     hooks = {},
        --     options = {
        --         "--keep-logs",
        --         "--synctex",
        --     },
        -- }
    end,
}
