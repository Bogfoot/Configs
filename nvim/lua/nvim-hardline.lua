-- require('hardline').setup {
-- 		bufferline = true, -- disable bufferline
-- 		bufferline_settings = {
-- 				exclude_terminal = false, -- don't show terminal buffers in bufferline
-- 				show_index = false, -- show buffer indexes (not the actual buffer numbers) in bufferline
-- 		},
-- 		theme = 'default', -- change theme
-- 		sections = { -- define sections
-- 				{ class = 'mode', item = require('hardline.parts.mode').get_item },
-- 				{ class = 'high', item = require('hardline.parts.git').get_item,     hide = 100 },
-- 				{ class = 'med',  item = require('hardline.parts.filename').get_item },
-- 				'%<',
-- 				{ class = 'med',     item = '%=' },
-- 				{ class = 'low',     item = require('hardline.parts.wordcount').get_item, hide = 100 },
-- 				{ class = 'error',   item = require('hardline.parts.lsp').get_error },
-- 				{ class = 'warning', item = require('hardline.parts.lsp').get_warning },
-- 				{ class = 'warning', item = require('hardline.parts.whitespace').get_item },
-- 				{ class = 'high',    item = require('hardline.parts.filetype').get_item,  hide = 60 },
-- 				{ class = 'mode',    item = require('hardline.parts.line').get_item },
-- 		},
-- }
require('lualine').setup {
		options = {
				icons_enabled = true,
				theme = 'molokai',
				component_separators = { left = '', right = '' },
				section_separators = { left = '', right = '' },
				disabled_filetypes = {
						statusline = {},
						winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = false,
				refresh = {
						statusline = 1000,
						tabline = 1000,
						winbar = 1000,
				}
		},
		sections = {
				lualine_a = { 'mode' },
				lualine_b = { 'branch', 'diff', 'diagnostics' },
				lualine_c = { 'filename' },
				lualine_x = { 'encoding', 'fileformat', 'filetype' },
				lualine_y = { 'progress' },
				lualine_z = { 'location' }
		},
		inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { 'filename' },
				lualine_x = { 'location' },
				lualine_y = {},
				lualine_z = {}
		},
		tabline = {},
		winbar = {},
		inactive_winbar = {},
		extensions = {}
}
require('Comment').setup()
require('neodev').setup()
