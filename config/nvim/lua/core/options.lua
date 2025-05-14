local opt = vim.opt

opt.number = true           -- 显示行号
opt.relativenumber = false  -- 相对行号
opt.tabstop = 8             -- Tab 显示宽度
opt.shiftwidth = 8          -- 自动缩进宽度
opt.expandtab = false       -- 将 Tab 转换为空格
opt.autoindent = true       -- 自动缩进
opt.mouse = ''              -- 启用鼠标支持
opt.ignorecase = true       -- 搜索忽略大小写
opt.smartcase = true        -- 智能大小写搜索
opt.termguicolors = true    -- 启用真彩色
opt.wrap = false            -- 不自动换行
opt.cursorline = true       -- 光标行

-- 系统剪贴板
opt.clipboard:append("unnamedplus")

-- 默认新窗口右和下
opt.splitright = true
opt.splitbelow = true

-- tagbar
vim.cmd([[
  autocmd FileType * if &filetype !=# 'go' | let g:tagbar_width = 35 | let g:tagbar_left = 1 | endif

  if !exists('g:tagbar_keymap_set')
    let g:tagbar_keymap_set = 1
    nnoremap <F2> :TagbarToggle<CR>
  endif

  autocmd VimEnter * if &filetype !=# 'go' | call tagbar#autoopen(1) | endif
]])

-- 记录上次退出时的位置
vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end
})

