require('telescope').setup({
	defaults = {
		prompt_prefix = "> ",  -- 提示符前缀
		selection_caret = ">", -- 选择项前缀
		layout_strategy = "horizontal",  -- 布局策略
		layout_config = {
			horizontal = {
				width = 0.9,  -- 水平布局宽度
				preview_width = 0.6, -- 预览窗口宽度
				prompt_position = "top",  -- 提示框的位置
			},
			vertical = { width = 0.7 }, -- 垂直布局宽度
		},
		sorting_strategy = "ascending",  -- 排序策略
		scroll_strategy = "cycle",  -- 滚动策略
		file_ignore_patterns = { "node_modules", "dist", "build" },  -- 忽略的文件夹
		mappings = {
			i = {
				["<C-n>"] = "move_selection_next",  -- 下一个项
				["<C-p>"] = "move_selection_previous",  -- 上一个项
				["<C-c>"] = "close",  -- 关闭窗口
			},
			n = {
				["<C-q>"] = "close",  -- 关闭窗口
			}
		},
	},
	pickers = {
		find_files = {
			theme = "dropdown",  -- 下拉主题
			hidden = true,  -- 显示隐藏文件
		},
		live_grep = {
			theme = "ivy",  -- Ivy 主题
		},
	},
	extensions = {
		fzf = {
			fuzzy = true,  -- 启用模糊搜索
			override_generic_sorter = false,  -- 覆盖通用排序器
			override_file_sorter = true,  -- 覆盖文件排序器
		}
	},
})

-- 自定义命令（根据需求调整）
vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fg', ':Telescope live_grep<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fb', ':Telescope buffers<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fh', ':Telescope help_tags<CR>', { noremap = true, silent = true })


