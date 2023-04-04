local vim = vim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
			"git",
			"clone",
			"--filter=blob:none",
			"https://github.com/folke/lazy.nvim.git",
			"--branch=stable", -- latest stable release
			lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
return require('lazy').setup({
				-- Dashboard when just running v/nvim
				{
						'goolord/alpha-nvim',
						config = function()
							require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
						end
				},
				-- Same as vim-smartinput, makes autopairs for containers [{("'`...`'")}]
				{ 'm4xshen/autoclose.nvim' },
				{ 'p00f/clangd_extensions.nvim' }, --C/C++ linter
				-- Pretty colours for hex colours, words of colours like "red", "green", "blue", ..., obviously dosn't work  for comments.
				{ 'norcalli/nvim-colorizer.lua' },


				{ 'nvim-lua/plenary.nvim' }, --Utility functions
				{ 'nvim-telescope/telescope.nvim' },

				{ 'hrsh7th/cmp-nvim-lsp' }, --Completion plugins
				{ 'hrsh7th/cmp-buffer' },
				{ 'hrsh7th/cmp-path' },
				{ 'hrsh7th/cmp-cmdline',
						({ "hrsh7th/nvim-cmp", dependencies = { { "kdheepak/cmp-latex-symbols" }, }, sources = {
								{ name = "latex_symbols" }, }, }) },
				{ "L3MON4D3/LuaSnip" },
				{ "saadparwaiz1/cmp_luasnip" }, -- snippet completions},

				{ 'neovim/nvim-lspconfig' },

				-- Debugger
				{ "mfussenegger/nvim-dap" }, --Basic debugger
				{
						"williamboman/mason.nvim",
						"williamboman/mason-lspconfig.nvim",
						"jay-babu/mason-nvim-dap.nvim",
				},
				-- { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" } },
				{ --syntax highlightin
						{
								'nvim-treesitter/nvim-treesitter',
								-- dependencies = { 'nvim-treesitter/nvim-treesitter-refactor', 'RRethy/nvim-treesitter-textsubjects', },
								build = ':TSUpdate',
						} },
				-- Comments
				{ 'numToStr/Comment.nvim' }, --Use ysw to surround a word, line, paragraph,... in a symbol (a-Z, 0-9, {[<()>]}, ...)},
				-- Surround
				{
						"kylechui/nvim-surround",
						version = "*", -- Use for stability; omit to use `main` branch for the latest features
						config = function() require("nvim-surround").setup({}) end
				},
				{ 'nvim-lualine/lualine.nvim' },
				-- { 'ojroques/nvim-hardline' },
				{ 'lervag/vimtex' }, --vimtex for editing TEX files in VIM
				{ 'pboettch/vim-cmake-syntax' }, --cmake syntax highlighting
				{ 'ryanoasis/vim-devicons' },
				--File tree
				{
						"nvim-neo-tree/neo-tree.nvim",
						branch = "v2.x",
						dependencies = {
								"nvim-lua/plenary.nvim",
								"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
								"MunifTanjim/nui.nvim",
						}
				},
				-- { 'stevearc/oil.nvim',            config = function() require('oil').setup() end },
				--Note taking
				{
						"nvim-neorg/neorg",
						build = ":Neorg sync-parsers",
						opts = {
								load = {
										["core.defaults"] = {}, -- Loads default behaviour
										["core.norg.concealer"] = {}, -- Adds pretty icons to your documents
										["core.norg.dirman"] = { -- Manages Neorg workspaces
												config = {
														workspaces = {
																notes = "~/Notes/PHD",
																work = "~/Work"
														},
														default_workspace = "notes",
												}, },
								},
						},
						dependencies = { { "nvim-lua/plenary.nvim" } },
				},
				{ 'rafi/awesome-vim-colorschemes' }, --Vim colorschemes
				{ 'frazrepo/vim-rainbow' }, --Colours matching containers in .c, .cpp,... files
				{ 'folke/neodev.nvim' }, -- LSP for neovim API
				{
						'rebelot/terminal.nvim',
						config = function()
							require("terminal").setup()
						end
				},
		})
