vim.g.mapleader = " "
vim.g.vimsyn_embed = 'lPr'

-- Options
local set = vim.opt
set.rnu = true
vim.wo.number = true
set.ruler = true
set.cursorline = true
set.sidescrolloff = 8
set.scrolloff = 999
set.tabstop = 4
set.shiftwidth = 4
set.softtabstop = 4
set.smartindent = true
set.wrap = false
set.smartcase = true
set.ignorecase = true
set.swapfile = false
set.conceallevel = 2
set.incsearch = true
set.laststatus = 2
set.clipboard = 'unnamedplus'
set.completeopt = { "menuone", "noselect", "noinsert" }, -- mostly just for cmp_nvim_lsp
set.compatible == false
set.encoding = "utf-8"
set.virtualedit = "block"
set.foldenable=false
