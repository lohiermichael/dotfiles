-- leader key. Default in "\" but SPACE is easier to access
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- template:
-- keymap.set(<vim_mode>, <used_cmd>, <replaced_cmd>)

----------------------
-- general keymaps
----------------------

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

----------------------
-- window management
----------------------

-- split window verticall-- split window vertically
keymap.set("n", "<leader>v", "<C-w>v")

-- split window horizontally
keymap.set("n", "<leader>h", "<C-w>s")

-- make split windows equal width & height
keymap.set("n", "<leader>e", "<C-w>=")

-- close current split window
keymap.set("n", "<leader>x", ":close<CR>")

----------------------
-- tab management
----------------------

-- open new tab
keymap.set("n", "<leader>tn", ":tabnew<CR>")
-- close current tab
keymap.set("n", "<leader>tx", ":tabclose<CR>")
--  go to next tab
keymap.set("n", "<leader>tk", ":tabn<CR>")
--  go to previous tab
keymap.set("n", "<leader>tj", ":tabp<CR>"
)

-- vim-maximizer
keymap.set("n", "<leader>m", ":MaximizerToggle<CR>")

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

----------------------
-- telescope
----------------------

-- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
-- find string in current working directory as you type
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
-- find string under cursor in current working directory
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
-- list open buffers in current neovim instance
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
-- list available help tags
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>"
)
