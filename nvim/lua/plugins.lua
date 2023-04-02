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
				{ 'goolord/alpha-nvim', config = function()
					require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
				end },
				-- Same as vim-smartinput, makes autopairs for containers [{("'`...`'")}]
				{ 'm4xshen/autoclose.nvim' },
				{ 'folke/neodev.nvim' }, -- LSP for neovim API
				{ 'p00f/clangd_extensions.nvim' }, --C/C++ linter
				{ "mfussenegger/nvim-dap" }, --Basic debugger
				-- Pretty colours for hex colours, words of colours like "red", "green", "blue", ..., obviously dosn't work  for comments.
				{ 'norcalli/nvim-colorizer.lua' },
				-- { "Djancyp/cheat-sheet",        { 'sudormrfbin/cheatsheet.nvim', dependencies = { { 'nvim-telescope/telescope.nvim' }, { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' }, } } },
				{ "anuvyklack/windows.nvim", dependencies = { "anuvyklack/middleclass", "anuvyklack/animation.nvim" },
						config = function()
							vim.o.winwidth = 10
							vim.o.winminwidth = 10
							vim.o.equalalways = false
							require('windows').setup(
									{
											autowidth = {
													enable = true,
													winwidth = 5,
													filetype = {
															help = 2,
													},
											},
											ignore = { --			|windows.ignore|
													buftype = { "quickfix" },
													filetype = { "NvimTree", "neo-tree", "undotree", "gundo" }
											},
											animation = {
													enable = true,
													duration = 300,
													fps = 30,
													easing = "in_out_sine"
											}
									})
						end },
				-- { "j-hui/fidget.nvim" },
				{ 'nvim-lua/plenary.nvim' }, --Utility functions
				{ 'nvim-telescope/telescope.nvim' },
				{ 'hrsh7th/cmp-nvim-lsp' }, --Completion plugins
				{ 'hrsh7th/cmp-buffer' },
				{ 'hrsh7th/cmp-path' },
				{ 'hrsh7th/cmp-cmdline',          ({ "hrsh7th/nvim-cmp", dependencies = { { "kdheepak/cmp-latex-symbols" }, }, sources = { { name = "latex_symbols" }, }, }) },
				{ "L3MON4D3/LuaSnip" },
				{ "saadparwaiz1/cmp_luasnip" }, -- snippet completions},
				{ 'neovim/nvim-lspconfig' },
				{ "williamboman/mason.nvim" },
				{ --syntax highlightin
						{ 'nvim-treesitter/nvim-treesitter',
								-- dependencies = { 'nvim-treesitter/nvim-treesitter-refactor', 'RRethy/nvim-treesitter-textsubjects', },
								build = ':TSUpdate',
						} },
				{ 'numToStr/Comment.nvim' }, --Use ysw to surround a word, line, paragraph,... in a symbol (a-Z, 0-9, {[<()>]}, ...)},
				{ "kylechui/nvim-surround", version = "*", -- Use for stability; omit to use `main` branch for the latest features
						config = function() require("nvim-surround").setup({}) end },
				{ 'rafi/awesome-vim-colorschemes' }, --Vim colorschemes
				{ 'frazrepo/vim-rainbow' }, --Colours matching containers in .c, .cpp,... files
				{ 'nvim-lualine/lualine.nvim' },
				-- { 'ojroques/nvim-hardline' },
				{ 'lervag/vimtex' }, --vimtex for editing TEX files in VIM
				{ 'pboettch/vim-cmake-syntax' }, --cmake syntax highlighting
				{ 'ryanoasis/vim-devicons' },
				{ 'stevearc/oil.nvim',            config = function() require('oil').setup() end },
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
																work = "~/Notes/Work",
																default = "~/Notes"

														},
														default_workspace = "default",
												},
										},
								},
						},
						dependencies = { { "nvim-lua/plenary.nvim" } },
				}
		})
