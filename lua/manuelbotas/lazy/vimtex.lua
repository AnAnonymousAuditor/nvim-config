return {
    "lervag/vimtex",
    lazy = false,
    init = function()
        -- VimTeX configuration goes here, e.g.
        vim.g.vimtex_view_method = "zathura_simple"

        -- Mappings
        vim.keymap.set("n", "dsm", "<Plug>(vimtex-env-delete-math)")
        vim.keymap.set("n", "csm", "<Plug>(vimtex-env-change-math)")
        vim.keymap.set("n", "tsm", "<Plug>(vimtex-env-toggle-math)")
        vim.keymap.set({ "x", "o" }, "ai", "<Plug>(vimtex-am)")
        vim.keymap.set({ "x", "o" }, "ii", "<Plug>(vimtex-im)")
        vim.keymap.set({ "x", "o" }, "am", "<Plug>(vimtex-a$)")
        vim.keymap.set({ "x", "o" }, "im", "<Plug>(vimtex-i$)")
    end,
}
