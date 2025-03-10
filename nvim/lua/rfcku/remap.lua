vim.g.mapleader = " "

-- Vim explorer
vim.keymap.set("n", "<leader>p", vim.cmd.Ex)
vim.keymap.set("v", "<C-c>", "<Esc>")

--
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("n", "<C-up>", "w")
vim.keymap.set("n", "<C-down>", "b")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "yy", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<C-l>", ":gd<CR>")

-- Move lines
vim.keymap.set({ "v" }, "K", ":m '<-2<CR>gv=gv")
vim.keymap.set({ "v" }, "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("n", "<C-j>", ":m .+1<CR>==") -- move line up(n)
vim.keymap.set("n", "<C-k>", ":m .-2<CR>==") -- move line down(n)
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv") -- move line up(v)
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv") -- move line down(v)

vim.keymap.set("n", "<C-p>", ":e#<CR>")

vim.keymap.set("n", "[", "[(")

vim.keymap.set("n", "]", "])")
