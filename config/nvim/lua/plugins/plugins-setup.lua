local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)


local plugins = {
	"folke/tokyonight.nvim", -- 主题
	-- "navarasu/onedark.nvim",
	-- "vim/colorschemes", -- 主题

	"nvim-lualine/lualine.nvim",  -- 状态栏
	"nvim-tree/nvim-tree.lua",  -- 文档树
	"nvim-tree/nvim-web-devicons", -- 文档树图标

	"nvim-treesitter/nvim-treesitter", -- 语法高亮
	"HiPhish/rainbow-delimiters.nvim", -- 彩色括号
	'preservim/tagbar',
	"shellRaining/hlchunk.nvim",
	"akinsho/toggleterm.nvim",

	{
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim", -- 这个相当于mason.nvim和lspconfig的桥梁
		"neovim/nvim-lspconfig"
	},

	-- 自动补全
	'neovim/nvim-lspconfig',
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-cmdline',
	'hrsh7th/nvim-cmp',

	"L3MON4D3/LuaSnip",
	"rafamadriz/friendly-snippets",
	"stevearc/oil.nvim",

	"preservim/nerdcommenter",
	"windwp/nvim-autopairs", -- 自动补全括号

	-- "akinsho/bufferline.nvim", -- buffer分割线
	"lewis6991/gitsigns.nvim", -- 左则git提示

	{
		'nvim-telescope/telescope.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' },
	},

}
local opts = {} -- 注意要定义这个变量
require("lazy").setup(plugins, opts)
