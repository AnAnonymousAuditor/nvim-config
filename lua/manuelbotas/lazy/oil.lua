return {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
        view_options = {
            show_hidden = true
        }
    },
    config = function(_, opts)
        require('oil').setup(opts)
        vim.keymap.set("n", "<leader>pv", vim.cmd.Oil)
    end
}
