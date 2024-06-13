-- for conciseness
local api = vim.api
local cmd = vim.cmd
local opt = vim.opt

-- line numbers
opt.number = true
opt.relativenumber = true
-- -- uncomment if relative numbering everywhere is
-- -- annoying
-- Not having relative numbers in insert mode
-- api.nvim_create_autocmd("InsertEnter", {
--   pattern = "*",
--   callback = function()
--     opt.relativenumber = false
--   end
-- })
-- api.nvim_create_autocmd("InsertLeave", {
--   pattern = "*",
--   callback = function()
--     opt.relativenumber = true
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

-- automatically save and load cursor position in files
api.nvim_create_augroup("restore_cursor_position", { clear = true })
api.nvim_create_autocmd("BufReadPost", {
  group = "restore_cursor_position",
  pattern = "*",
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local line_count = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= line_count then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- set a vertical white line at 80 characters
opt.colorcolumn = "80"
cmd [[highlight ColorColumn ctermbg=none guibg=white]]

-- set spell checker
-- see: https://www.youtube.com/watch?v=KoL-2WTlr04 for shortcuts
opt.spelllang = 'en_us'
opt.spell = true
