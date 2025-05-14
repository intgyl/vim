local lspconfig = require('lspconfig')

lspconfig.clangd.setup {
	cmd = {
		"clangd",
		"--background-index",
		"--clang-tidy",
		"--completion-style=detailed",
		"--header-insertion=iwyu",
		"--cross-file-rename",
	},
	on_attach = function(client, bufnr)
		local opts = { noremap = true, silent = true, buffer = bufnr }

		-- 使用 telescope 进行异步跳转
		vim.keymap.set('n', '<C-k>', require('telescope.builtin').lsp_definitions, opts)

		-- 快速跳回原处
		vim.keymap.set('n', '<C-t>', '<C-o>', opts)
	end,
}
