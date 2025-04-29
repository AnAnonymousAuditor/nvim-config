return {
    "tmsvg/pear-tree",
    init = function()
        vim.g.pear_tree_ft_disabled = { "TelescopePrompt" }
        vim.g.pear_tree_smart_openers = 1
        vim.g.pear_tree_smart_closers = 1
        vim.g.pear_tree_smart_backspace = 1
        vim.keymap.set("i", "<C-c>", "<Plug>(PearTreeFinishExpansion)")
    end,
}
