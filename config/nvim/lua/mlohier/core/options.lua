local opt = vim.opt -- for conciseness

-- line numbers
opt.number = true
opt.relativenumber = true
-- -- uncomment if relative numbering everywhere is
-- -- annoying
-- Not having relative numbers in insert mode
-- vim.api.nvim_create_autocmd("InsertEnter", {
--   pattern = "*",
--   callback = function()
--     vim.opt.relativenumber = false
--   end
-- })
-- vim.api.nvim_create_autocmd("InsertLeave", {
--   pattern = "*",
--   callback = function()
--     vim.opt.relativenumber = true
--   end
-- })

-- tabs and indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search settings
-- example: searching 'hello' is gonna match 'hello' and 'Hello'
opt.ignorecase = true
-- example: searching 'Hello' is gonna match 'Hello' only
opt.smartcase = true

-- cursor line highlighted
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- -- backspace
opt.backspace = "indent,eol,start"

-- clipboard
-- use the system clipboards in neovim
opt.clipboard = "unnamedplus"

-- split windows
opt.splitright = true
opt.splitbelow = true

-- consider "-" as part of a word
 opt.iskeyword:append("-")
