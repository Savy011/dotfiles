return {
	--Colorschemes
	'catppuccin/nvim',
	'folke/tokyonight.nvim',
	'whatyouhide/vim-gotham',
	'ellisonleao/gruvbox.nvim',
    {
	--Text
	'rrethy/vim-hexokinase',
	'lukas-reineke/indent-blankline.nvim',
	'nvim-treesitter/nvim-treesitter',
	'nvim-treesitter/nvim-treesitter-context',
	'folke/zen-mode.nvim',
	'folke/twilight.nvim',
	'numToStr/Comment.nvim',
	'windwp/nvim-autopairs',
    },
    {
	"iamcco/markdown-preview.nvim",
	build = function() 
	    vim.fn["mkdp#util#install"]() 
	end,
    },
    {
	--Auto-Completetion & LSP
	'VonHeikemen/lsp-zero.nvim',
	branch = 'v1.x',
	dependencies = {
	    -- LSP Support
	    {'neovim/nvim-lspconfig'},
	    {'williamboman/mason.nvim'},
	    {'williamboman/mason-lspconfig.nvim'},

	    -- Autocompletion
	    {'hrsh7th/nvim-cmp'},
	    {'hrsh7th/cmp-nvim-lsp'},
	    {'hrsh7th/cmp-buffer'},
	    {'hrsh7th/cmp-path'},
	    {'hrsh7th/cmp-emoji'},
	    {'saadparwaiz1/cmp_luasnip'},
	    {'hrsh7th/cmp-nvim-lua'},

	    -- Snippets
	    {'L3MON4D3/LuaSnip'},
	    {'rafamadriz/friendly-snippets'},
	}
    },
    {
	--User Interface
	'karb94/neoscroll.nvim',
	'jbyuki/nabla.nvim',
	'mrjones2014/nvim-ts-rainbow',
	'Pocco81/true-zen.nvim',
	'nvim-tree/nvim-tree.lua',
	{
	    'nvim-telescope/telescope.nvim',
	    dependencies = { {'nvim-lua/plenary.nvim'} }
	},
	'onsails/lspkind.nvim',
	'goolord/alpha-nvim',
	'akinsho/bufferline.nvim',
	'nvim-lualine/lualine.nvim',
	{
	  "folke/noice.nvim",
	  dependencies = {
	    "MunifTanjim/nui.nvim",
	    "rcarriga/nvim-notify",
	    }
	},
	{
	"utilyre/barbecue.nvim",
	name = "barbecue",
	version = "*",
	dependencies = {
	    "SmiteshP/nvim-navic",
	    "nvim-tree/nvim-web-devicons",
		},
	},
    }
}
