require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗"
		}
	}
})

require("mason-lspconfig").setup({
	-- 确保安装，根据需要填写
	ensure_installed = {
		"lua_ls",
		"pyright",
		"clangd",
		"bashls",
	},
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')

require("lspconfig").lua_ls.setup {
	capabilities = capabilities,
}

-- 配置 Python 的 LSP
lspconfig.pylsp.setup{}

-- 配置 C/C++ 的 LSP
lspconfig.clangd.setup{}

lspconfig.lua_ls.setup{}
