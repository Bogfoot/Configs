vim.g.mapleader = " "
vim.g.vimsyn_embed = 'lPr'

-- Options
local set = vim.opt
set.rnu = true
vim.wo.number = true
set.ruler = true
set.cursorline = true
set.sidescrolloff = 8
set.scrolloff = 3
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.smartindent = true
set.wrap = false
set.smartcase = true
set.ignorecase = true
set.updatetime = 300
set.swapfile = false
set.conceallevel = 2
set.incsearch = true
set.laststatus = 2
set.clipboard = 'unnamedplus'
set.completeopt = { "menuone", "noselect", "noinsert" }, -- mostly just for cmp_nvim_lsp
		set.compatible == false
set.encoding = "utf-8"
set.foldmethod="manual"
