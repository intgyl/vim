require("tokyonight").setup({
	style = "storm", -- 可选：storm, moon, night, day
	on_colors = function(colors)
		colors.hint = colors.orange
		colors.error = "#ff0000"
	end,
	on_highlights = function(highlights, colors)
		-- highlights.Function = { fg = colors.blue}
		-- highlights.Comment  = { fg = colors.cyan, italic = true }
		-- highlights.String   = { fg = "#98c379" }
		-- highlights.Type     = { fg = colors.green }
	end,
})

vim.cmd[[colorscheme tokyonight]]
vim.cmd[[hi Normal guibg=NONE ctermbg=NONE]]
-- vim.cmd[[highlight NonText guibg=NONE ctermbg=NONE]]
-- vim.cmd[[highlight LineNr guibg=NONE ctermbg=NONE]]

