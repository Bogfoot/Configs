local vim = vim
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

nmap("<leader>n", ":noh<cr>:call clearmatches()<cr>")

-- Find files using Telescope command-line sugar.
nmap("<leader>ff", "<cmd>Telescope find_files<cr>")
nmap("<leader>fg", "<cmd>Telescope live_grep<cr>")
nmap("<leader>fh", "<cmd>Telescope help_tags<cr>")
-- NERDTree naredbe
nmap("<C-t>", ":Neotree toggle<CR>")
--Dap
nmap("<leader>dbp", ":lua require'dap'.toggle_breakpoint()<CR>")
nmap("<leader>dc", ":lua require'dap'.continue()<CR>")
nmap("<leader>dso", ":lua require'dap'.step_over()<CR>")
-- Moje naredbe
vim.cmd([[ nmap <Leader>-c :%s/\s\+$// <CR> ]])
nmap("<Leader>go", ":source vimbook.vim <CR>") --ova i iduća naredba stvaraju 'vimbook' file koji sadrži file i položaj u file u kojem se zadnje radilo (za koji se koristila iduća naredba)
nmap("<Leader>end", ":w <CR>:mksession! vimbook.vim<CR>:q <CR>")
nmap("<Leader>ws", ":w <CR> :source %<CR>")
nmap("<Leader>bn", ":bn<CR>")
nmap("<Leader>bp", ":bp<CR>")
nmap("<Leader>bw", ":bw<CR>")
nmap("<Leader>cht", ":CheatSH<CR>")
nmap("<F3>", '<C-R>=strftime("%d.%m.%Y")<CR><Esc>')
imap("<F3>", '<C-R>=strftime("%d.%m.%Y")<CR>')

vmap(">", "<gv")
vmap(">", ">gv")

local term_map = require("terminal.mappings")
vim.keymap.set({ "n", "x" }, "<leader>ts", term_map.operator_send, { expr = true })
vim.keymap.set("n", "<leader>to", term_map.toggle)
vim.keymap.set("n", "<leader>tO", term_map.toggle({ open_cmd = "enew" }))
vim.keymap.set("n", "<leader>tr", term_map.run)
vim.keymap.set("n", "<leader>tR", term_map.run(nil, { layout = { open_cmd = "enew" } }))
vim.keymap.set("n", "<leader>tk", term_map.kill)
vim.keymap.set("n", "<leader>t]", term_map.cycle_next)
vim.keymap.set("n", "<leader>t[", term_map.cycle_prev)
vim.keymap.set("n", "<leader>tl", term_map.move({ open_cmd = "belowright vnew" }))
vim.keymap.set("n", "<leader>tL", term_map.move({ open_cmd = "botright vnew" }))
vim.keymap.set("n", "<leader>th", term_map.move({ open_cmd = "belowright new" }))
vim.keymap.set("n", "<leader>tH", term_map.move({ open_cmd = "botright new" }))
vim.keymap.set("n", "<leader>tf", term_map.move({ open_cmd = "float" }))



-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
		vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
		vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set('n', '<space>wl', function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
		vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
		vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
		vim.keymap.set('n', '<space>f', function()
			vim.lsp.buf.format { async = true }
		end, opts)
	end,
})
-- Dap Keybinds
vim.keymap.set('n', "<F5>", ":lua require'dapui'.toggle()<CR>")
vim.keymap.set("n", "<F6>", ":lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<F7>", ":lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<F8>", ":lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<F9>", ":lua require'dap'.step_out()<CR>")
vim.keymap.set("n", "<leader>dbp", ":lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<leader>ro", ":lua require'dap'.repl.open()<CR>")
