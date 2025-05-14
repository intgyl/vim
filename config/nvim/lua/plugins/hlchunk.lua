require("hlchunk").setup({
	chunk = {
		enable = true,
		notify = false,
		use_treesitter = false,
		chars = {
			horizontal_line = "─",
			vertical_line = "│",
			left_top = "╭",
			left_bottom = "╰",
			right_arrow = "▶",
		},
		style = {
			{ fg = "#D19A66" }, -- 更改为你喜欢的颜色
		},
		support_filetypes = { "*" }, -- 作用于所有文件类型
	},
	indent = {
		enable = true,
		use_treesitter = true,
		chars = { "│" },
		style = {
			{ fg = "#6f3f3f" }, -- 红
			{ fg = "#7a7345" }, -- 黄
			{ fg = "#5f7358" }, -- 绿
			{ fg = "#456f73" }, -- 青
			{ fg = "#45637a" }, -- 蓝
			{ fg = "#6a4f73" }, -- 紫
		},
	},
	blank = {
		enable = false,
	},
	line_num = {
		enable = true,
	},
    })
