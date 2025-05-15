vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.c", "*.cc", "*.cpp", "*.h", "*.hpp" },
	callback = function()
		vim.keymap.set('n', '<F4>', function()
			local filepath = vim.fn.expand('%:p')
			vim.cmd('write')
			vim.fn.system({ 'astyle',
			'--style=linux', '-p','--indent=force-tab=8', '--break-blocks=all',
			'--indent-switches', '--pad-oper', '--pad-comma', '--pad-header',
			'--suffix=none', '--align-pointer=name',
			'--align-reference=name', '--break-one-line-headers',
			'--attach-return-type', '--attach-return-type-decl', filepath })
			vim.cmd('edit')
		end, { buffer = true, desc = 'Format with astyle (F4)' })
	end,
})

