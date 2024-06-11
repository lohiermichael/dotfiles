-- leader key. Default in "\" but SPACE is easier to access
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- general keymaps
-- template:
-- keymap.set(<vim_mode>, <used_cmd>, <replaced_cmd>)

-- window management
keymap.set("n", "<leader>v", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>h", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>e", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>x", ":close<CR>") -- close current split window

-- tab management (not often used)
keymap.set("n", "<leader>tn", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tk", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tj", ":tabp<CR>") --  go to previous tab

--plugin keymaps

-- vim-maximizer
keymap.set("n", "<leader>m", ":MaximizerToggle<CR>")
