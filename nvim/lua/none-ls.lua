local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.completion.spell,			-- Spelling completion
		null_ls.builtins.completion.luasnip,		-- Completion for luasnip
		null_ls.builtins.diagnostics.codespell,		-- Checks basic code syntax
		null_ls.builtins.diagnostics.chktex,		-- Latex diagnostics
		null_ls.builtins.diagnostics.cmake_lint,	-- Cmake static analysis
		null_ls.builtins.diagnostics.cppcheck,		-- check C/C++ code -- Static analysis
		null_ls.builtins.diagnostics.vulture,		-- Finds unused code and points it out somehow
		null_ls.builtins.formatting.astyle,			-- C/C++/Arduino... Style formatting
		null_ls.builtins.formatting.beautysh,		-- Bash style formatting
        null_ls.builtins.formatting.stylua,			-- Lua style formatting
		null_ls.builtins.formatting.bibclean,		-- A portable program (written in C) that will pretty-print, syntax check, and generally sort out a BibTeX database file.
		null_ls.builtins.formatting.black,			-- Python style formatting
		null_ls.builtins.formatting.isort,			-- Formatting python imports
		null_ls.builtins.formatting.clang_format,	-- Formatter for C/C++
	},
})
