require("toggleterm").setup({
	size = 15, -- 终端窗口大小
	open_mapping = [[<C-\>]], -- 快捷键打开终端
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true, -- 打开后进入插入模式
	insert_mappings = true,
	persist_size = true,
	direction = "horizontal", -- 可选：horizontal / vertical / float / tab
	close_on_exit = true,
	shell = vim.o.shell, -- 使用默认 shell
	float_opts = {
		border = "curved", -- 单/双线/圆角框线："single" | "double" | "curved" | "shadow"
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})

vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", {noremap = true, silent = true})
-- vim.api.nvim_set_keymap("t", "<C-l>", "<Cmd> wincmd l<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("t", "<C-h>", "<Cmd> wincmd h<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("t", "<C-j>", "<Cmd> wincmd j<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("t", "<C-k>", "<Cmd> wincmd k<CR>", {noremap = true, silent = true})
