require("autoclose").setup({
		keys = {
				["("] = { escape = false, close = true, pair = "()" },
				["["] = { escape = false, close = true, pair = "[]" },
				["{"] = { escape = false, close = true, pair = "{}" },

				[">"] = { escape = true, close = false, pair = "<>" },
				[")"] = { escape = true, close = false, pair = "()" },
				["]"] = { escape = true, close = false, pair = "[]" },
				["}"] = { escape = true, close = false, pair = "{}" },

				['"'] = { escape = true, close = true, pair = '""' },
				["'"] = { escape = true, close = true, pair = "''" },
				["`"] = { escape = true, close = false, pair = "``" },
		},
		options = {
				disabled_filetypes = { "text", "markdown", "tex", "neorg", "norg" },
		},
})
