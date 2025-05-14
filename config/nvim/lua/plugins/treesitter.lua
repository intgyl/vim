require'nvim-treesitter.configs'.setup {
	-- 添加不同语言
	ensure_installed = { "vim", "vimdoc", "bash", "c", "cpp", "javascript", "json", "lua", "python", "typescript", "tsx", "css", "rust", "markdown", "markdown_inline" }, -- one of "all" or a list of languages

	highlight = { enable = true },
	indent = { enable = true },
}

-- 设置高亮样式：为 TODO 注释设置橙色粗体
vim.api.nvim_set_hl(0, "@comment.todo", { fg = "#ff9e64", bold = true }) -- 橙色，粗体

-- 定义 Tree-sitter 查询高亮规则
vim.cmd([[
  augroup TodoHighlight
  autocmd!
  autocmd FileType * syntax match TodoComment /TODO\|FIXME\|BUG\|NOTE\|HACK\|WARN\|XXX/
  autocmd FileType * highlight link TodoComment Todo
  augroup END
]])
