require("oil").setup({
		-- Id is automatically added at the beginning, and name at the end
		-- See :help oil-columns
		columns = {
				"icon",
				-- "permissions",
				-- "size",
				-- "mtime",
		},
		-- Buffer-local options to use for oil buffers
		buf_options = {
				buflisted = false,
		},
		-- Window-local options to use for oil buffers
		win_options = {
				wrap = false,
				signcolumn = "no",
				cursorcolumn = false,
				foldcolumn = "0",
				spell = false,
				list = false,
				conceallevel = 3,
				concealcursor = "n",
		},
		-- Restore window options to previous values when leaving an oil buffer
		restore_win_options = true,
		-- Skip the confirmation popup for simple operations
		skip_confirm_for_simple_edits = false,
		-- Keymaps in oil buffer. Can be any value that `vim.keymap.set` accepts OR a table of keymap
		-- options with a `callback` (e.g. { callback = function() ... end, desc = "", nowait = true })
		-- Additionally, if it is a string that matches "actions.<name>",
		-- it will use the mapping at require("oil.actions").<name>
		-- Set to `false` to remove a keymap
		-- See :help oil-actions for a list of all available actions
		keymaps = {
				["g?"] = "actions.show_help",
				["<CR>"] = "actions.select",
				["<C-s>"] = "actions.select_vsplit",
				["<C-h>"] = "actions.select_split",
				["<C-t>"] = "actions.select_tab",
				["<C-p>"] = "actions.preview",
				["<C-c>"] = "actions.close",
				["<C-l>"] = "actions.refresh",
				["-"] = "actions.parent",
				["_"] = "actions.open_cwd",
				["`"] = "actions.cd",
				["~"] = "actions.tcd",
				["g."] = "actions.toggle_hidden",
		},
		-- Set to false to disable all of the above keymaps
		use_default_keymaps = true,
		view_options = {
				-- Show files and directories that start with "."
				show_hidden = false,
		},
		-- Configuration for the floating window in oil.open_float
		float = {
				-- Padding around the floating window
				padding = 2,
				max_width = 0,
				max_height = 0,
				border = "rounded",
				win_options = {
						winblend = 10,
				},
		},
})

require('nvim-treesitter.configs').setup {
		-- Add languages to be installed here that you want installed for treesitter
		ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'typescript', 'help', 'vim' },
		highlight = { enable = true },
		indent = { enable = true, disable = { 'python' } },
		incremental_selection = {
				enable = true,
				keymaps = {
						init_selection = '<c-space>',
						node_incremental = '<c-space>',
						scope_incremental = '<c-s>',
						node_decremental = '<c-backspace>',
				},
		},
		textobjects = {
				select = {
						enable = true,
						lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
						keymaps = {
								-- You can use the capture groups defined in textobjects.scm
								['aa'] = '@parameter.outer',
								['ia'] = '@parameter.inner',
								['af'] = '@function.outer',
								['if'] = '@function.inner',
								['ac'] = '@class.outer',
								['ic'] = '@class.inner',
						},
				},
				move = {
						enable = true,
						set_jumps = true, -- whether to set jumps in the jumplist
						goto_next_start = {
								[']m'] = '@function.outer',
								[']]'] = '@class.outer',
						},
						goto_next_end = {
								[']M'] = '@function.outer',
								[']['] = '@class.outer',
						},
						goto_previous_start = {
								['[m'] = '@function.outer',
								['[['] = '@class.outer',
						},
						goto_previous_end = {
								['[M'] = '@function.outer',
								['[]'] = '@class.outer',
						},
				},
				swap = {
						enable = true,
						swap_next = {
								['<leader>a'] = '@parameter.inner',
						},
						swap_previous = {
								['<leader>A'] = '@parameter.inner',
						},
				},
		},
}
