local keymap = vim.keymap

-- ---------- 插入模式 ---------- ---
keymap.set("i", "jk", "<ESC>")

-- ---------- 视觉模式 ---------- ---
-- 单行或多行移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- ---------- 正常模式 ---------- ---
-- 切换buffer
keymap.set("n", "<C-L>", ":bnext<CR>")
keymap.set("n", "<C-H>", ":bprevious<CR>")

-- ---------- 插件 ---------- ---
-- nvim-tree
keymap.set("n", "<F3>", ":NvimTreeToggle<CR>")

keymap.set("n", "q", ":q<ENTER>")
keymap.set("n", "Q", ":q<ENTER>")
keymap.set("n", "wq", ":wq<ENTER>")
keymap.set("n", "<space>", "$")
keymap.set("n", "f", "0")
keymap.set("n", "s", "%")
keymap.set("n", ";", "*")
keymap.set("n", "e", "#")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-l>", "<C-w>l")

-- Lazy
keymap.set("n", "<F5>", ":Lazy<ENTER>")

keymap.set("i", "<C-a>", "<Home>")
keymap.set("i", "<C-e>", "<End>")
keymap.set("i", "<C-b>", "<Left>")
keymap.set("i", "<C-f>", "<Right>")


-- 鼠标模式
vim.keymap.set("n", "<leader>n", function()
  vim.o.mouse = "n"
  print("Mouse mode set to 'n'")
end, { desc = "Set mouse mode to normal" })

vim.keymap.set("n", "<leader>=", function()
  vim.o.mouse = ""
  print("Mouse mode set to ''")
end, { desc = "Set mouse mode to none" })

-- snippets 自定义代码片段
local ls = require("luasnip")
vim.keymap.set("i", "<C-k>", function()
  if ls.expandable() then
    ls.expand()
  end
end, { silent = true })

