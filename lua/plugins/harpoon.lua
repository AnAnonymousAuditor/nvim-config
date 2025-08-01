return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
    },
    config = function()
        -- stylua: ignore start
        local harpoon = require("harpoon")

        -- REQUIRED
        harpoon:setup()
        -- REQUIRED

        vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, { desc = "Add buffer to harpoon" })

        vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end, { desc = "Select 1st buffer" })
        vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end, { desc = "Select 2nd buffer" })
        vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end, { desc = "Select 3rd buffer" })
        vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end, { desc = "Select 4th buffer" })
        vim.keymap.set("n", "<leader>h<C-h>", function() harpoon:list():replace_at(1) end, { desc = "Replace 1st buffer" })
        vim.keymap.set("n", "<leader>h<C-j>", function() harpoon:list():replace_at(2) end, { desc = "Replace 2nd buffer" })
        vim.keymap.set("n", "<leader>h<C-k>", function() harpoon:list():replace_at(3) end, { desc = "Replace 3rd buffer" })
        vim.keymap.set("n", "<leader>h<C-l>", function() harpoon:list():replace_at(4) end, { desc = "Replace 4th buffer" })

        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set("n", "<C-P>", function() harpoon:list():prev() end, { desc = "Previous harpoon buffers" })
        vim.keymap.set("n", "<C-N>", function() harpoon:list():next() end, { desc = "Next harpoon buffers" })

        vim.keymap.set("n", "<leader>hx", function() harpoon:list():clear() end, { desc = "Clear harpoon list" })

        -- basic telescope configuration
        local conf = require("telescope.config").values
        local function toggle_telescope(harpoon_files)
            local file_paths = {}
            for _, item in ipairs(harpoon_files.items) do
                table.insert(file_paths, item.value)
            end

            require("telescope.pickers").new({}, {
                prompt_title = "Harpoon",
                finder = require("telescope.finders").new_table({
                    results = file_paths,
                }),
                previewer = conf.file_previewer({}),
                sorter = conf.generic_sorter({}),
            }):find()
        end

        vim.keymap.set("n", "<leader>ho", function() toggle_telescope(harpoon:list()) end,
            { desc = "Open harpoon window" })
        -- stylua: ignore end
    end,
}
