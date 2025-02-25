vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.have_nerd_font = false
-- [[ Setting options ]]
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.wo.number = true
vim.opt.rnu = true
vim.opt.ruler = true
vim.opt.sidescrolloff = 8
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.conceallevel = 2
vim.opt.incsearch = true
vim.opt.laststatus = 2
vim.opt.completeopt = { "menuone", "noselect", "noinsert" } -- mostly just for cmp_nvim_lsp
vim.opt.compatible = false
vim.opt.encoding = "utf-8"
vim.opt.virtualedit = "block"
vim.opt.foldenable = false
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)
vim.opt.breakindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.inccommand = "split"
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.o.equalalways = false
