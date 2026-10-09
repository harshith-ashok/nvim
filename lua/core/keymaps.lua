local keymap = vim.keymap

keymap.set("n", "<leader>e", ":NvimTreeFocus<CR>")
keymap.set("n", "<leader>w", ":w<CR>")
keymap.set("n", "<leader>q", ":q<CR>")

keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-l>", "<C-w>l")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")

-- Next / previous buffer
keymap.set("n", "<leader>.", ":bnext<CR>")
keymap.set("n", "<leader>,", ":bprevious<CR>")

-- Tab spaces
keymap.set("v", ">", ">gv")
keymap.set("v", "<", "<gv")

-- Close buffer
keymap.set("n", "<leader>x", ":bdelete<CR>")
