return require('packer').startup(function(use)
	-- Configuration is going here --
	use 'wbthomason/packer.nvim'
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'
	use 'neovim/nvim-lspconfig'

	-- Hrsh7th Code Completion Suite --
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-nvim-lua'
	use 'hrsh7th/cmp-nvim-lsp-signature-help'
	use 'hrsh7th/cmp-vsnip'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-buffer'
	use {
		'hrsh7th/cmp-vsnip',
		after = 'nvim-cmp',
		requires = {
			'hrsh7th/vim-vsnip',

			'hrsh7th/vim-vsnip-integ',
			{
				'radfamadrize/friendly-snippets',
				after = 'cmp-vsnip'
			}
		}
	}

	-- vim-dadbod is for database handeling and ui --
	use 'tpope/vim-dadbod'
	use 'tpope/vim-dotenv'
	use 'kristijanhusak/vim-dadbod-completion'
	use 'kristijanhusak/vim-dadbod-ui'

	-- Harpoon for file navigation --
	use {
		'ThePrimeagen/harpoon',
		requires = "nvim-lua/plenary.nvim"
	}

	-- file explorer tree --
	use 'nvim-tree/nvim-web-devicons'
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons',
		}
	}

	-- DAP for debugging
	use 'mfussenegger/nvim-dap'
	use {
		'rcarriga/nvim-dap-ui',
		requires = {
			'mfussenegger/nvim-dap'
		}
	}

	-- themes for styling --
	use 'Mofiqul/dracula.nvim'
	use 'folke/tokyonight.nvim'

	-- Treesitter --
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,
	}

	-- Telescope used to fuzzy search files --
	use {
		'nvim-telescope/telescope.nvim',
		requires = {{ 'nvim-lua/plenary.nvim' }}
	}

	-- lualine information / Status bar
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyadzani42/nvim-web-devicons', opt = true, }
	}

	-- Auto pair to generate brackets etc
	use {
		'windwp/nvim-autopairs',
		config = function() 
			require('nvim-autopairs').setup{}
		end,
	}

	-- Bufferline is a header with all opend buffers
	use {
		'akinsho/bufferline.nvim',
		tag = 'v3.*',
		requires = 'nvim-tree/nvim-web-devicons'
	}

	-- Indent guide --
	use 'lukas-reineke/indent-blankline.nvim'

	-- Floatterm to run lazygit --
	use 'voldikss/vim-floaterm'

	-- Linter --
	use 'mfussenegger/nvim-lint'

	-- Rust --
	use 'simrat39/rust-tools.nvim'

	-- Trouble VScode error bar --
	use 'folke/trouble.nvim'

	-- TODO comments --
	use {
		'folke/todo-comments.nvim',
		requires = 'nvim-lua/plenary.nvim'
	}

	-- Session to remember opened files and position in project --
	use {
		'rmagatti/auto-session',
		config = function()
			require('auto-session').setup {
				log_level = 'error',
				auto_session_enabled = true,
				auto_restore_enabled = true,
				auto_save_enabled = true,
			}
		end
	}

	-- Transparency without hassle --
	use ({
		'xiyaowong/nvim-transparent',
	})
	-- Tag bar for quick nav in large files --
	use 'preservim/tagbar'
	use {
		'lewis6991/gitsigns.nvim'
	}

end)
