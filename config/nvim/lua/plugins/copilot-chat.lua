require("CopilotChat").setup({
})

vim.keymap.set("n", "<C-i>", ":CopilotChatToggle<CR>", { desc = "Open CopilotChat" })

