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
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	Packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
end --
return require('packer').startup(function(use)
	use {
		'goolord/alpha-nvim',
		config = function()
			require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
		end
	}
	use 'p00f/clangd_extensions.nvim' --C/C++ linter
	use "mfussenegger/nvim-dap" --Basic debugger
	use 'norcalli/nvim-colorizer.lua'
	use { "Djancyp/cheat-sheet" }
	use {
		'sudormrfbin/cheatsheet.nvim',

		requires = {
			{ 'nvim-telescope/telescope.nvim' },
			{ 'nvim-lua/popup.nvim' },
			{ 'nvim-lua/plenary.nvim' },
		}
	}
	use { "anuvyklack/windows.nvim",
		requires = {
			"anuvyklack/middleclass",
			"anuvyklack/animation.nvim"
		},
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
				}
			)
		end
	}
	-- use 'dbeniamine/cheat.sh-vim'
	use 'nvim-lua/plenary.nvim' --Utility functions
	use 'nvim-telescope/telescope.nvim'
	use 'hrsh7th/cmp-nvim-lsp' --Completion plugins
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			{ "kdheepak/cmp-latex-symbols" },
		},
		sources = {
			{ name = "latex_symbols" },
		},
	})
	use "L3MON4D3/LuaSnip"
	use "saadparwaiz1/cmp_luasnip" -- snippet completions
	use 'neovim/nvim-lspconfig'
	use 'williamboman/nvim-lsp-installer'
	use { --syntax highlightin
		'nvim-treesitter/nvim-treesitter',
		requires = {
			'nvim-treesitter/nvim-treesitter-refactor',
			'RRethy/nvim-treesitter-textsubjects',
		},
		run = ':TSUpdate',
	}
	use 'tpope/vim-surround' --Use ysw to surround a word, line, paragraph,... in a symbol (a-Z, 0-9, {[<()>]}, ...)
	use 'tpope/vim-commentary' --For commenting out a block of code
	use 'rafi/awesome-vim-colorschemes' --Vim colorschemes
	use 'kana/vim-smartinput' --This one matches containers
	use 'frazrepo/vim-rainbow' --Colours matching containers in .c, .cpp,... files
	use 'vim-airline/vim-airline' --Statusbar
	use 'vim-airline/vim-airline-themes' --Statusbar themes
	use 'lervag/vimtex' --vimtex for editing TEX files in VIM
	use 'pboettch/vim-cmake-syntax' --cmake syntax highlighting
	use 'ryanoasis/vim-devicons'
	use 'preservim/nerdtree' --File explorer for VIM
	if Packer_bootstrap then
		require('packer').sync()
	end
end)
