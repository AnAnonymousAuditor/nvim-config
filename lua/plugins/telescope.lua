return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-ui-select.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            cond = function()
                return vim.fn.executable("make") == 1
            end,
        },
        {
            "nvim-telescope/telescope-live-grep-args.nvim",
            version = "^1.1.0",
        },
    },

    config = function()
        local telescope = require("telescope")
        telescope.setup({
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown(),
                },
            },
        })
        telescope.load_extension("fzf")
        telescope.load_extension("ui-select")
        telescope.load_extension("live_grep_args")
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Search files" })
        -- vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Search by grep" })
        vim.keymap.set(
            "n",
            "<leader>sg",
            telescope.extensions.live_grep_args.live_grep_args,
            { desc = "Search by grep with args" }
        )
        vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Search help" })
        vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Search buffers" })
        vim.keymap.set("n", "<leader>sw", function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end, { desc = "Search current word" })
        vim.keymap.set("n", "<leader>sW", function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end, { desc = "Search current WORD" })
    end,
}
