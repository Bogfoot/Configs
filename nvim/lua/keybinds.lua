vim.cmd('noremap <C-b> :noh<cr>:call clearmatches()<cr>') -- clear matches Ctrl+b
function map(mode, shortcut, command)
	vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
	map('n', shortcut, command)
end

function imap(shortcut, command)
	map('i', shortcut, command)
end

function vmap(shortcut, command)
	map('v', shortcut, command)
end

function cmap(shortcut, command)
	map('c', shortcut, command)
end

function tmap(shortcut, command)
	map('t', shortcut, command)
end

nmap("<leader>n", ":nohl<cr>")

-- Find files using Telescope command-line sugar.
nmap("<leader>ff", "<cmd>Telescope find_files<cr>")
nmap("<leader>fg", "<cmd>Telescope live_grep<cr>")
nmap("<leader>fh", "<cmd>Telescope help_tags<cr>")
-- NERDTree naredbe
-- nmap("<C-t>", ":NERDTreeToggle <CR>")
nmap("<C-t>", ":Oil <CR>")
--Dap
nmap("<leader>dbp", ":lua require'dap'.toggle_breakpoint()<CR>")
nmap("<leader>dc", ":lua require'dap'.continue()<CR>")
nmap("<leader>dso", ":lua require'dap'.step_over()<CR>")
-- Moje naredbe
vim.cmd([[ nmap <Leader>-c :%s/\s\+$// <CR> ]])
nmap("<F3>", ":set nu! <CR>")
nmap("<Leader>go", ":source vimbook.vim <CR>") --ova i iduća naredba stvaraju 'vimbook' file koji sadrži file i položaj u file u kojem se zadnje radilo (za koji se koristila iduća naredba)
nmap("<Leader>end", ":w <CR>:mksession! vimbook.vim<CR>:q <CR>")
nmap("<Leader>ws", ":w <CR> :source %<CR>")
nmap("<Leader>bn", ":bn<CR>")
nmap("<Leader>bp", ":bp<CR>")
nmap("<Leader>bw", ":bw<CR>")
nmap("<Leader>cht", ":CheatSH<CR>")

vmap(">", "<gv")
vmap(">", ">gv")
