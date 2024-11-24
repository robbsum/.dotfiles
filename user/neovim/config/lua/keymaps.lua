vim.g.mapleader = " "

-- Manage buffers
vim.keymap.set("n", "<Tab>", "<CMD>bn<CR>", {silent = true})
vim.keymap.set("n", "<S-Tab>", "<CMD>bp<CR>", {silent = true})
vim.keymap.set("n", "<C-q>", "<CMD>bd<CR>", {silent = true})
