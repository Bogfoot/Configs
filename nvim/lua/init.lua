local vim = vim
--Lazy install if not installed.
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
vim.g.mapleader = " "
vim.opt.termguicolors = true
vim.opt.undofile = true
require("plugins")
require("settings")
require("treesitter")
require("keybinds")
require("miscelanious")
require("nvim-cmp")
require("autocommands")
require("autopairs")
require("nvim-tree")
require("nvim-lualine")
require("lsp")
require("none-ls")
require("todo")

