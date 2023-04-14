local fn = vim.fn

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- General Settings
local general = augroup("General Settings", { clear = true })

vim.cmd([[
augroup vimrc_todo
    au!
		au Syntax * syn match MyTodo /\v<(FIXME|NOTE|TODO|OPTIMIZE|XXX):/
          \ containedin=.*Comment,vimCommentTitle
augroup END
hi def link MyTodo Todo
autocmd BufNewFile,BufReadPre *.tex hi clear Conceal
]])

autocmd("BufWritePre", {
	callback = function()
		vim.lsp.buf.format { async = true }
	end,
	group = general,
	desc = "Autoformat on save.",
})

autocmd("BufReadPost", {
	callback = function()
		if fn.line "'\"" > 1 and fn.line "'\"" <= fn.line "$" then
			vim.cmd 'normal! g`"'
		end
	end,
	group = general,
	desc = "Go To The Last Cursor Position",
})

autocmd("TextYankPost", {
	callback = function()
		require("vim.highlight").on_yank { higroup = "YankHighlight", timeout = 200 }
	end,
	group = general,
	desc = "Highlight when yanking",
})

autocmd("BufEnter", {
	callback = function()
		vim.opt.formatoptions:remove { "c", "r", "o" }
	end,
	group = general,
	desc = "Disable New Line Comment",
})

autocmd("FileType", {
	pattern = { "c", "cpp", "py", "java", "cs" },
	callback = function()
		vim.bo.shiftwidth = 4
	end,
	group = general,
	desc = "Set shiftwidth to 4 in these filetypes",
})

-- autocmd({ "BufWinLeave", "BufLeave", "InsertLeave", "InsertEnter", "FocusLost" }, {
-- 	callback = function()
-- 		vim.cmd "silent! w"
-- 	end,
-- 	group = general,
-- 	desc = "Auto Save when leaving/entering insert mode, buffer or window",
-- })

autocmd("FileType", {
	pattern = { "gitcommit", "markdown", "text", "log" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
	group = general,
	desc = "Enable Wrap in these filetypes",
})
