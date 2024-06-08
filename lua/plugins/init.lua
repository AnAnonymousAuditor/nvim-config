return {

    {
        'nvim-telescope/telescope.nvim',
        branch = "0.1.x",
        dependencies = {
            'nvim-lua/plenary.nvim'
        }
    },

    {
        'rose-pine/neovim',
        name = 'rose-pine',
    },

    {
        'almo7aya/neogruvbox.nvim',
        name = 'neogruvbox',
    },

    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000 ,
        config = true,
        opts = ...
    },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },

    'AndreM222/copilot-lualine',

    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
    },

    'mbbill/undotree',
    'tpope/vim-fugitive',
    'tmsvg/pear-tree',

    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },

    {
        'ThePrimeagen/harpoon',
        branch = 'harpoon2',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope.nvim'
        }
    },

    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter"
    },

    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        dependencies = {
            -- LSP Support
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},
            {'neovim/nvim-lspconfig'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }
}
