vim.g.mapleader = " "

-- Vim explorer
vim.keymap.set("n", "<leader>p", vim.cmd.Ex)

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

-- Copy line
vim.keymap.set("n", "yy", [["+Y]])

-- vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Exit insert mode
vim.keymap.set({ "i", "n", "v" }, "<C-c>", "<Esc>")

-- Format code
vim.keymap.set("n", "<C-f>", vim.lsp.buf.format)

vim.keymap.set("n", "<C-'>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-;>", "<cmd>cprev<CR>zz")

vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Move lines
vim.keymap.set("n", "<C-k>", ":m .-2<CR>==") -- move line down(n)
vim.keymap.set("n", "<C-j>", ":m .+1<CR>==") -- move line up(n)

-- Go to the next/previous buffer
vim.keymap.set("n", "<C-p>", ":e#<CR>")

-- Exit insert mode
vim.keymap.set("n", "<Esc>", "<Esc>")

-- Move cursor to the first caracter of the paragraph
vim.keymap.set("n", "[", "^")
vim.keymap.set("n", "]", "$")

vim.keymap.set("n", "}", "/^\\s*$\\n\\zs\\S<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "{", "?\\n\\zs\\S<CR>", { noremap = true, silent = true })
