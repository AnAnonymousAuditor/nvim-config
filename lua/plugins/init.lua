return {

  {
	  'nvim-telescope/telescope.nvim',
      version = "0.1.x",
      dependencies = {
          'nvim-lua/plenary.nvim'
      }
  },

  {
	  'rose-pine/neovim',
	  name = 'rose-pine',
      --[[
	  config = function()
		  vim.cmd('colorscheme rose-pine')
	  end
      --]]
  },

  {
      'almo7aya/neogruvbox.nvim',
      name = 'neogruvbox',
      ----[[
      config = function ()
        vim.cmd('colorscheme neogruvbox')
      end
      --]]
  },

  {
      'nvim-lualine/lualine.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' }
  },

  {
      'nvim-treesitter/nvim-treesitter',
      build = ':TSUpdate'
  },

  'mbbill/undotree',
  'tpope/vim-fugitive',
  'tmsvg/pear-tree',

  {
      'ThePrimeagen/harpoon',
      branch = 'harpoon2',
      dependencies = {
          'nvim-lua/plenary.nvim',
          'nvim-telescope/telescope.nvim'
      }
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
