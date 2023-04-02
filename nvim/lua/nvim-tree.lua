require("neo-tree").setup({
	close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
	popup_border_style = "rounded",
	enable_git_status = true,
	enable_diagnostics = true,
	open_files_do_not_replace_types = { "terminal", "trouble", "qf" }, -- when opening files, do not use windows containing these filetypes or buftypes
	sort_case_insensitive = false,                                    -- used when sorting files and directories in the tree
	sort_function = nil,                                              -- use a custom function for sorting files and directories in the tree
	-- sort_function = function (a,b)
	--       if a.type == b.type then
	--           return a.path > b.path
	--       else
	--           return a.type > b.type
	--       end
	--   end , -- this sorts files and directories descendantly
	default_component_configs = {
		container = {
			enable_character_fade = true
		},
		indent = {
			indent_size = 2,
			padding = 1, -- extra padding on left hand side
			-- indent guides
			with_markers = true,
			indent_marker = "│",
			last_indent_marker = "└",
			highlight = "NeoTreeIndentMarker",
			-- expander config, needed for nesting files
			with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
			expander_collapsed = "",
			expander_expanded = "",
			expander_highlight = "NeoTreeExpander",
		},
		icon = {
			folder_closed = "",
			folder_open = "",
			folder_empty = "ﰊ",
			-- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
			-- then these will never be used.
			default = "*",
			highlight = "NeoTreeFileIcon"
		},
		modified = {
			symbol = "[+]",
			highlight = "NeoTreeModified",
		},
		name = {
			trailing_slash = false,
			use_git_status_colors = true,
			highlight = "NeoTreeFileName",
		},
		git_status = {
			symbols = {
				-- Change type
				added     = "✚", -- or "✚", but this is redundant info if you use git_status_colors on the name
				modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
				deleted   = "✖", -- this can only be used in the git_status source
				renamed   = "", -- this can only be used in the git_status source
				-- Status type
				untracked = "",
				ignored   = "",
				unstaged  = "",
				staged    = "",
				conflict  = "",
			}
		},
	},
	window = {
		position = "left",
		width = 40,
		mapping_options = {
			noremap = true,
			nowait = true,
		},
		mappings = {
			["<space>"] = {
				"toggle_node",
				nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
			},
			["<2-LeftMouse>"] = "open",
			["<cr>"] = "open",
			["<esc>"] = "revert_preview",
			["P"] = { "toggle_preview", config = { use_float = true } },
			["l"] = "focus_preview",
			["S"] = "open_split",
			["s"] = "open_vsplit",
			-- ["S"] = "split_with_window_picker",
			-- ["s"] = "vsplit_with_window_picker",
			["t"] = "open_tabnew",
			-- ["<cr>"] = "open_drop",
			-- ["t"] = "open_tab_drop",
			["w"] = "open_with_window_picker",
			--["P"] = "toggle_preview", -- enter preview mode, which shows the current node without focusing
			["C"] = "close_node",
			-- ['C'] = 'close_all_subnodes',
			["z"] = "close_all_nodes",
			--["Z"] = "expand_all_nodes",
			["a"] = {
				"add",
				-- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:h neo-tree-file-actions` for details
				-- some commands may take optional config options, see `:h neo-tree-mappings` for details
				config = {
					show_path = "none" -- "none", "relative", "absolute"
				}
			},
			["A"] = "add_directory", -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
			["d"] = "delete",
			["r"] = "rename",
			["y"] = "copy_to_clipboard",
			["x"] = "cut_to_clipboard",
			["p"] = "paste_from_clipboard",
			["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
			-- ["c"] = {
			--  "copy",
			--  config = {
			--    show_path = "none" -- "none", "relative", "absolute"
			--  }
			--}
			["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
			["q"] = "close_window",
			["R"] = "refresh",
			["?"] = "show_help",
			["<"] = "prev_source",
			[">"] = "next_source",
		}
	},
	nesting_rules = {},
	filesystem = {
		filtered_items = {
			visible = true, -- when true, they will just be displayed differently than normal items
			hide_dotfiles = false,
			hide_gitignored = true,
			hide_hidden = false, -- only works on Windows for hidden files/directories
			hide_by_name = {
				--"node_modules"
			},
			hide_by_pattern = { -- uses glob style patterns
				--"*.meta",
				--"*/src/*/tsconfig.json",
			},
			always_show = { -- remains visible even if other settings would normally hide it
				--".gitignored",
			},
			never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
				--".DS_Store",
				--"thumbs.db"
			},
			never_show_by_pattern = { -- uses glob style patterns
				--".null-ls_*",
			},
		},
		follow_current_file = false,          -- This will find and focus the file in the active buffer every
		-- time the current file is changed while the tree is open.
		group_empty_dirs = false,             -- when true, empty folders will be grouped together
		hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
		-- in whatever position is specified in window.position
		-- "open_current",  -- netrw disabled, opening a directory opens within the
		-- window like netrw would, regardless of window.position
		-- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
		use_libuv_file_watcher = false, -- This will use the OS level file watchers to detect changes
		-- instead of relying on nvim autocmd events.
		window = {
			mappings = {
				["<bs>"] = "navigate_up",
				["."] = "set_root",
				["H"] = "toggle_hidden",
				["/"] = "fuzzy_finder",
				["D"] = "fuzzy_finder_directory",
				["#"] = "fuzzy_sorter", -- fuzzy sorting using the fzy algorithm
				-- ["D"] = "fuzzy_sorter_directory",
				["f"] = "filter_on_submit",
				["<c-x>"] = "clear_filter",
				["[g"] = "prev_git_modified",
				["]g"] = "next_git_modified",
			}
		}
	},
	buffers = {
		follow_current_file = true, -- This will find and focus the file in the active buffer every
		-- time the current file is changed while the tree is open.
		group_empty_dirs = true,  -- when true, empty folders will be grouped together
		show_unloaded = true,
		window = {
			mappings = {
				["bd"] = "buffer_delete",
				["<bs>"] = "navigate_up",
				["."] = "set_root",
			}
		},
	},
	git_status = {
		window = {
			position = "float",
			mappings = {
				["A"]  = "git_add_all",
				["gu"] = "git_unstage_file",
				["ga"] = "git_add_file",
				["gr"] = "git_revert_file",
				["gc"] = "git_commit",
				["gp"] = "git_push",
				["gg"] = "git_commit_and_push",
			}
		}
	}
})



-- require("oil").setup({
-- 		-- Id is automatically added at the beginning, and name at the end
-- 		-- See :help oil-columns
-- 		columns = {
-- 				"icon",
-- 				-- "permissions",
-- 				-- "size",
-- 				-- "mtime",
-- 		},
-- 		-- Buffer-local options to use for oil buffers
-- 		buf_options = {
-- 				buflisted = false,
-- 		},
-- 		-- Window-local options to use for oil buffers
-- 		win_options = {
-- 				wrap = false,
-- 				signcolumn = "no",
-- 				cursorcolumn = false,
-- 				foldcolumn = "0",
-- 				spell = false,
-- 				list = false,
-- 				conceallevel = 3,
-- 				concealcursor = "n",
-- 		},
-- 		-- Restore window options to previous values when leaving an oil buffer
-- 		restore_win_options = true,
-- 		-- Skip the confirmation popup for simple operations
-- 		skip_confirm_for_simple_edits = false,
-- 		-- Keymaps in oil buffer. Can be any value that `vim.keymap.set` accepts OR a table of keymap
-- 		-- options with a `callback` (e.g. { callback = function() ... end, desc = "", nowait = true })
-- 		-- Additionally, if it is a string that matches "actions.<name>",
-- 		-- it will use the mapping at require("oil.actions").<name>
-- 		-- Set to `false` to remove a keymap
-- 		-- See :help oil-actions for a list of all available actions
-- 		keymaps = {
-- 				["g?"] = "actions.show_help",
-- 				["<CR>"] = "actions.select",
-- 				["<C-s>"] = "actions.select_vsplit",
-- 				["<C-h>"] = "actions.select_split",
-- 				["<C-t>"] = "actions.select_tab",
-- 				["<C-p>"] = "actions.preview",
-- 				["<C-c>"] = "actions.close",
-- 				["<C-l>"] = "actions.refresh",
-- 				["-"] = "actions.parent",
-- 				["_"] = "actions.open_cwd",
-- 				["`"] = "actions.cd",
-- 				["~"] = "actions.tcd",
-- 				["g."] = "actions.toggle_hidden",
-- 		},
-- 		-- Set to false to disable all of the above keymaps
-- 		use_default_keymaps = true,
-- 		view_options = {
-- 				-- Show files and directories that start with "."
-- 				show_hidden = false,
-- 		},
-- 		-- Configuration for the floating window in oil.open_float
-- 		float = {
-- 				-- Padding around the floating window
-- 				padding = 2,
-- 				max_width = 0,
-- 				max_height = 0,
-- 				border = "rounded",
-- 				win_options = {
-- 						winblend = 10,
-- 				},
-- 		},
-- })
--
-- require('nvim-treesitter.configs').setup {
-- 		-- Add languages to be installed here that you want installed for treesitter
-- 		ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'typescript', 'help', 'vim' },
-- 		highlight = { enable = true },
-- 		indent = { enable = true, disable = { 'python' } },
-- 		incremental_selection = {
-- 				enable = true,
-- 				keymaps = {
-- 						init_selection = '<c-space>',
-- 						node_incremental = '<c-space>',
-- 						scope_incremental = '<c-s>',
-- 						node_decremental = '<c-backspace>',
-- 				},
-- 		},
-- 		textobjects = {
-- 				select = {
-- 						enable = true,
-- 						lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
-- 						keymaps = {
-- 								-- You can use the capture groups defined in textobjects.scm
-- 								['aa'] = '@parameter.outer',
-- 								['ia'] = '@parameter.inner',
-- 								['af'] = '@function.outer',
-- 								['if'] = '@function.inner',
-- 								['ac'] = '@class.outer',
-- 								['ic'] = '@class.inner',
-- 						},
-- 				},
-- 				move = {
-- 						enable = true,
-- 						set_jumps = true, -- whether to set jumps in the jumplist
-- 						goto_next_start = {
-- 								[']m'] = '@function.outer',
-- 								[']]'] = '@class.outer',
-- 						},
-- 						goto_next_end = {
-- 								[']M'] = '@function.outer',
-- 								[']['] = '@class.outer',
-- 						},
-- 						goto_previous_start = {
-- 								['[m'] = '@function.outer',
-- 								['[['] = '@class.outer',
-- 						},
-- 						goto_previous_end = {
-- 								['[M'] = '@function.outer',
-- 								['[]'] = '@class.outer',
-- 						},
-- 				},
-- 				swap = {
-- 						enable = true,
-- 						swap_next = {
-- 								['<leader>a'] = '@parameter.inner',
-- 						},
-- 						swap_previous = {
-- 								['<leader>A'] = '@parameter.inner',
-- 						},
-- 				},
-- 		},
-- }
