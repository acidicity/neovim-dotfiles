vim.g.mapleader = " "

local keymap = vim.keymap

-- general keymaps

keymap.set("n", "<leader>nh", ":nohl<CR>") -- remove search highlights
keymap.set("n", "x", '"_x') -- do not copy the deleted character into the register

-- splitting windows
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

-- managing tabs
keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- go to previous tab

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- telescope
keymap.set("n", "<leader>f", "<cmd>Telescope find_files<cr>")
