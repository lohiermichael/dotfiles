-- leader key. Default in "\" but SPACE is easier to access
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- template:
-- keymap.set(<vim_mode>, <used_cmd>, <replaced_cmd>)

----------------------
-- general key maps
----------------------

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- clear search
keymap.set('n', '<leader>/', ':nohlsearch<CR>', { noremap = true, silent = true })

----------------------
-- window management
----------------------

-- split window vertically
keymap.set("n", "<leader>v", "<C-w>v")

-- split window horizontally
keymap.set("n", "<leader>h", "<C-w>s")

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
keymap.set("n", "<leader>tj", ":tabp<CR>")

-- vim-maximizer
keymap.set("n", "<leader>m", ":MaximizerToggle<CR>")

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

----------------------
-- telescope
----------------------

-- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>ff", ":Telescope find_files<CR>")
-- find string in current working directory as you type
keymap.set("n", "<leader>fs", ":Telescope live_grep<CR>")
-- find string under cursor in current working directory
keymap.set("n", "<leader>fc", ":Telescope grep_string<CR>")
-- list open buffers in current neovim instance
keymap.set("n", "<leader>fb", ":Telescope buffers<CR>")
-- list available help tags
keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>")

----------------------
-- git
----------------------

keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", {})
keymap.set("n", "<leader>gbl", ":Gitsigns blame_line<CR>", {})

----------------------
-- specific
----------------------

-- add a commented copyright line at the top of the buffer
function add_copyright()
  -- get the current buffer's file type
  local filetype = vim.bo.filetype
  local copyright_line

  -- building the line
  -- determine the header line based on file type
  if filetype == "lua" then
      copyright_line = "--"
  elseif filetype == "python" then
      copyright_line = "#"
  elseif filetype == 'javascript' then
      copyright_line = "//"
  else
      copyright_line = ""
  end

  copyright_line = copyright_line .. " Copyright ©"
  copyright_line = copyright_line .. " Michael Lohier"
  copyright_line = copyright_line .. " " .. os.date("%Y")
  copyright_line = copyright_line .. " All rights reserved."

  vim.api.nvim_buf_set_lines(0, 0, 0, false, {copyright_line})
  -- save the file after adding the line
  vim.api.nvim_command('write')
end

-- map a key to call the function (Example: <Leader>c)
vim.api.nvim_set_keymap(
  'n', '<Leader>c', '<Cmd>lua add_copyright()<CR>',
  { noremap = true, silent = true }
)


-- remove trailing spaces in the entire file
function removeTrailingSpaces()
  -- save the current cursor position
  local current_pos = vim.fn.getpos(".")
  -- Search and remove trailing spaces in the whole file
  vim.cmd([[%s/\s\+$//e]])
  -- prompt a message
  vim.api.nvim_echo({{"Trailing spaces removed", "InfoMsg"}}, false, {})
  -- Restore the cursor position after removal
  vim.fn.setpos(".", current_pos)
end

-- create a keymap to call the function
vim.api.nvim_set_keymap(
  'n', '<leader>ts', '<Cmd>lua removeTrailingSpaces()<CR>',
  { noremap = true, silent = true }
)
