-- Ensure the function is not loaded multiple times
if vim.g.loaded_auto_mkdir then
	return
end
vim.g.loaded_auto_mkdir = true

-- Check if the required features are available
if not vim.fn.exists("*mkdir") then
	vim.cmd([[echomsg "auto_mkdir: mkdir() is not available, plugin disabled."]])
	return
end

if not vim.fn.has("autocmd") then
	vim.cmd([[echomsg "auto_mkdir: autocommands not available, plugin disabled."]])
	return
end

-- Define the auto-mkdir function
local function auto_mkdir()
	-- Get directory of the file being saved
	local dir = vim.fn.expand("<afile>:p:h")

	-- Create the directory (and its parents) if it doesn't exist
	if not vim.fn.isdirectory(dir) then
		vim.fn.mkdir(dir, "p")
	end
end

-- Create an autocommand group for auto-mkdir
vim.api.nvim_create_augroup("auto_mkdir", { clear = true })
vim.api.nvim_create_autocmd({ "BufWritePre", "FileWritePre" }, {
	group = "auto_mkdir",
	pattern = "*",
	callback = auto_mkdir,
})
