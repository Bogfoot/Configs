-- [[ Basic Keymaps ]]

-- NERDTree Keymap
vim.keymap.set("n", "<C-t>", ":Neotree toggle<CR>", { desc = "Toggle file explorer (Neotree)" })

-- Custom Commands
vim.keymap.set("n", "<leader>-c", ":%s/\\s\\+$//<CR>", { desc = "Remove trailing whitespace" })
vim.keymap.set("n", "<leader>go", ":source vimbook.vim<CR>", { desc = "Source vimbook session" })
vim.keymap.set("n", "<leader>end", ":w<CR>:mksession! vimbook.vim<CR>:q<CR>", { desc = "Save and close with session" })

-- Buffer Navigation
vim.keymap.set("n", "<leader>bn", ":bn<CR>", { desc = "Go to next buffer" })
vim.keymap.set("n", "<leader>bp", ":bp<CR>", { desc = "Go to previous buffer" })
vim.keymap.set("n", "<leader>bw", ":bw<CR>", { desc = "Close current buffer" })

-- Insert Mode Keymap
vim.keymap.set("i", "<F3>", '<C-R>=strftime("%Y-%m-%d")<CR>', { desc = "Insert current date" })

-- Visual Mode Keymaps
vim.keymap.set("v", ">", "<gv", { desc = "Indent and stay in selection" })
vim.keymap.set("v", "<", "<gv", { desc = "Outdent and stay in selection" })

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Quickfix mobility
vim.keymap.set("n", "<M-p>", "<cmd>cprev<CR>", { desc = "Move to previous quick fix item" })
vim.keymap.set("n", "<M-k>", "<cmd>cnext<CR>", { desc = "Move to next quick fix item" })

-- Quality of life
