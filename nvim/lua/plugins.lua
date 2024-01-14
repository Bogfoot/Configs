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
return require("lazy").setup({
	-- Dashboard when just running v/nvim
	{
		-- 'goolord/alpha-nvim',
		-- config = function()
		-- 	require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
		-- end
		"goolord/alpha-nvim",
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")
			dashboard.section.header.val = {
				[[                                                                       ]],
				[[                                                                       ]],
				[[                                                                       ]],
				[[                                                                       ]],
				[[                                                                       ]],
				[[                                                                       ]],
				[[                                                                       ]],
				[[                                                                     ]],
				[[       ████ ██████           █████      ██                     ]],
				[[      ███████████             █████                             ]],
				[[      █████████ ███████████████████ ███   ███████████   ]],
				[[     █████████  ███    █████████████ █████ ██████████████   ]],
				[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
				[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
				[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
				[[                                                                       ]],
				[[                                                                       ]],
				[[                                                                       ]],
			}
			-- [[    _       _      _			   ]],
			-- [[   / \   __| |_ __(_) __ _ _ __  ]],
			-- [[  / _ \ / _` | '__| |/ _` | '_ \ ]],
			-- [[ / ___ \ (_| | |  | | (_| | | | |]],
			-- [[/_/   \_\__,_|_|  |_|\__,_|_| |_|]],
			--
			--        }
			dashboard.section.buttons.val = {
				dashboard.button("e", "  New file", "<cmd>ene <BAR> startinsert <CR> <cmd>Neotree<CR>"),
				dashboard.button("n", "󰎈  Open Neorg", "<cmd>Neorg index<CR> <cmd>Neotree<CR>"),
				dashboard.button("N", "󰌚	Open PhDNotes", "<cmd>cd ~/Notes/PhDNotes<CR> <cmd>Neotree<CR>"),
				dashboard.button("SPC f f", "󰈞  Find file"),
				dashboard.button("SPC f g", "󰊄  Live grep"),
				dashboard.button("SPC c", "  Configuration", "<cmd>cd ~/.config/nvim/lua/<CR> <cmd>e init.lua<CR>"),
				dashboard.button("u", "  Update plugins", "<cmd>Lazy sync<CR>"),
				dashboard.button("q", "󰅚  Quit NVIM", "<cmd>qa<CR>"),
			}
			local handle = io.popen("fortune")
			local fortune = handle:read("*a")
			handle:close()
			local function footer()
				return "Beauty is but an illusion, truth is a lie, death is the future, we must all die."
			end
			dashboard.section.footer.val = footer()

			dashboard.config.opts.noautocmd = true

			vim.cmd([[autocmd User AlphaReady echo 'ready']])

			alpha.setup(dashboard.config)
		end,
	},
	{ "p00f/clangd_extensions.nvim" }, --C/C++ linter
	-- Pretty colours for hex colours, words of colours like "red", "green", "blue", ..., obviously doesn't work  for comments.
	{ "norcalli/nvim-colorizer.lua" },
	{ "nvim-lua/plenary.nvim" }, --Utility functions
	{ "nvim-telescope/telescope.nvim" },
	{ "hrsh7th/cmp-nvim-lsp" }, --Completion plugins
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{
		"hrsh7th/cmp-cmdline",
		{
			"hrsh7th/nvim-cmp",
			dependencies = { { "kdheepak/cmp-latex-symbols" } },
			sources = {
				{ name = "latex_symbols" },
			},
		},
	},
	-- snippet completions,
	{ "mireq/luasnip-snippets", dependencies = { "L3MON4D3/LuaSnip" } },
	{
		"L3MON4D3/LuaSnip",
		build = "make install_jsregexp",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
	},
	-- LSP
	{ "neovim/nvim-lspconfig" },
	-- Debugger
	{ "mfussenegger/nvim-dap", dependencies = { "rcarriga/nvim-dap-ui", "mfussenegger/nvim-dap-python" } }, --Basic debugger
	{ "jay-babu/mason-nvim-dap.nvim" },
	-- Find variable definitions
	{ "theHamsta/nvim-dap-virtual-text" },
	{ "jbyuki/one-small-step-for-vimkind" },
	{
		{
			"williamboman/mason.nvim",
			build = ":MasonUpdate",
		},
		"williamboman/mason-lspconfig.nvim",
	},
	{ --syntax highlighting
		{
			"nvim-treesitter/nvim-treesitter",
			build = ":TSUpdate",
		},
	},
	{ "nvim-lualine/lualine.nvim" },
	{ "pboettch/vim-cmake-syntax" }, --cmake syntax highlighting
	--File tree
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
	},
	{ "folke/neodev.nvim" }, -- LSP for neovim API
	{ "nvimtools/none-ls.nvim" },
	{
		"rebelot/terminal.nvim",
		config = function()
			require("terminal").setup()
		end,
	},
	{ "lervag/vimtex" }, --vimtex for editing TEX files in VIM
	--Note taking
	{
		"nvim-neorg/neorg",
		build = ":Neorg sync-parsers",
		opts = {
			load = {
				["core.defaults"] = {}, -- Loads default behaviour
				["core.concealer"] = {}, -- Adds pretty icons to your documents
				["core.completion"] = {
					config = { engine = "nvim-cmp" },
				}, -- Adds pretty icons to your documents
				["core.summary"] = {}, -- Adds pretty icons to your documents
				["core.ui.calendar"] = {}, -- Adds pretty icons to your documents
				["core.dirman"] = { -- Manages Neorg workspaces
					config = {
						workspaces = {
							notes = "~/Notes/PhDNotes/PHD",
							work = "~/Work",
						},
						default_workspace = "notes",
					},
				},
			},
		},
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},
	{ "frazrepo/vim-rainbow" }, --Colours matching containers in .c, .cpp,... files
	{ "rafi/awesome-vim-colorschemes" }, --Vim colorschemes
	-- Comments
	{ "numToStr/Comment.nvim" }, --Use ysw to surround a word, line, paragraph,... in a symbol (a-Z, 0-9, {[<()>]}, ...)},
	-- Surround
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup({})
		end,
	},
	-- Same as vim-smartinput, makes autopairs for containers [{("'`...`'")}]
	{ "m4xshen/autoclose.nvim" },
	{ "jose-elias-alvarez/null-ls.nvim" },
})
