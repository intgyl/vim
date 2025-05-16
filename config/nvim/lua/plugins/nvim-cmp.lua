local kind_icons = {
	Text = "󰉿",
	Method = "󰆧",
	Function = "󰊕",
	Constructor = "",
	Field = "",
	Variable = "󰀫",
	Class = "󰠱",
	Interface = "",
	Module = "",
	Property = "",
	Unit = "",
	Value = "󰎠",
	Enum = "",
	Keyword = "󰌋",
	Snippet = "",
	Color = "󰏘",
	File = "󰈙",
	Reference = "",
	Folder = "󰉋",
	EnumMember = "",
	Constant = "󰏿",
	Struct = "",
	Event = "",
	Operator = "󰆕",
	TypeParameter = "",
	Misc = " ",
}

local t = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end
local cmp = require('cmp')
local luasnip = require("luasnip")

cmp.setup{
	snippet = {
		expand = function(args)
			-- vim.fn["UltiSnips#Anon"](args.body)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = {

		-- tab 键选择
		--[[
		[                 ["<Tab>"] = cmp.mapping({
		[                         c = function()
		[                                 if cmp.visible() then
		[                                         cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
		[                                 else
		[                                         cmp.complete()
		[                                 end
		[                         end,
		[                         i = function(fallback)
		[                                 if cmp.visible() then
		[                                         cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
		[                                 elseif luasnip.expand_or_jumpable() then
		[                                         luasnip.expand_or_jump()
		[                                 else
		[                                         fallback()
		[                                 end
		[                         end
		[                 }),
		[                 ["<S-Tab>"] = cmp.mapping({
		[                         c = function()
		[                                 if cmp.visible() then
		[                                         cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
		[                                 else
		[                                         cmp.complete()
		[                                 end
		[                         end,
		[                         i = function(fallback)
		[                                 if cmp.visible() then
		[                                         cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
		[                                 elseif luasnip.jumpable(-1) then
		[                                         luasnip.jump(-1)
		[                                 else
		[                                         fallback()
		[                                 end
		[ 
		[                         end
		[                 }),
		]]

		-- Tab：仅在 snippet 中跳转，不用于补全选择
		["<Tab>"] = function(fallback)
			if luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end,

		-- Shift-Tab：跳转回上一个 snippet 占位符
		["<S-Tab>"] = function(fallback)
			if luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end,

		['<Down>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
		['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
		['<C-n>'] = cmp.mapping({
			c = function()
				if cmp.visible() then
					cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
				else
					vim.api.nvim_feedkeys(t('<Down>'), 'n', true)
				end
			end,
			i = function(fallback)
				if cmp.visible() then
					cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
				else
					fallback()
				end
			end
		}),
		['<C-p>'] = cmp.mapping({
			c = function()
				if cmp.visible() then
					cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
				else
					vim.api.nvim_feedkeys(t('<Up>'), 'n', true)
				end
			end,
			i = function(fallback)
				if cmp.visible() then
					cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
				else
					fallback()
				end
			end
		}),
		['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
		['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'}),
		--['<C-e>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
		--['<C-e>'] = cmp.mapping({ i = cmp.mapping.close(), c = cmp.mapping.close() }),


		-- enter自动选择第一个
		['<CR>'] = cmp.mapping({
			i = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
			c = function(fallback)
				if cmp.visible() then
					cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true})
				else
					fallback()
				end
			end
		}),
	},

	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			-- Kind icons
			vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
			vim_item.menu = ({
				nvim_lsp = "[LSP]",
				-- ultisnips = "[Snippet]",
				buffer = "[Buffer]",
				path = "[Path]",
			})[entry.source.name]
			return vim_item
		end,
	},

	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		-- { name = 'ultisnips' },
	}, {
		-- { name = 'buffer' },
		-- { name = 'path' },
	})
}

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
	}, {
		{ name = 'buffer' },
	})
})

-- Use buffer source foj `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
	completion = { autocomplete = false },
	sources = {
		{ name = 'buffer' }
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	completion = { autocomplete = false },
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})

vim.keymap.set('n', 'gd', vim.lsp.buf.declaration, bufopts)
-- vim.keymap.set('n', '<C-k>', vim.lsp.buf.definition, bufopts)
vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
-- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
-- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
vim.keymap.set('n', '<C-t>', '<C-o>', bufopts)
-- vim.keymap.set({"i"}, "<C-K>", function() luasnip.expand() end, {silent = true})
