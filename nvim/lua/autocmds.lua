-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`
local fn = vim.fn
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
-- General Settings
local general = augroup("General Settings", { clear = true })

autocmd("BufReadPost", {
	callback = function()
		if fn.line("'\"") > 1 and fn.line("'\"") <= fn.line("$") then
			vim.cmd('normal! g`"')
		end
	end,
	group = general,
	desc = "Go To The Last Cursor Position",
})

autocmd("FileType", {
	pattern = { "gitcommit", "markdown", "text", "log" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
	group = general,
	desc = "Enable Wrap in these filetypes",
})

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

autocmd("FileType", {
	pattern = "tex",
	callback = function()
		vim.opt_local.spell = true
		vim.opt_local.spelllang = "en_us"
	end,
})
