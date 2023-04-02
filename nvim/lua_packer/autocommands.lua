vim.cmd([[
augroup vimrc_todo
    au!
		au Syntax * syn match MyTodo /\v<(FIXME|NOTE|TODO|OPTIMIZE|XXX):/
          \ containedin=.*Comment,vimCommentTitle
augroup END
hi def link MyTodo Todo

autocmd BufNewFile,BufReadPre *.tex hi clear Conceal 

]])
