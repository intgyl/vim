require("CopilotChat").setup({
})

vim.keymap.set("n", "<F8>", ":CopilotChatToggle<CR>", { desc = "Open CopilotChat" })

