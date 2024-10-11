-- import mason plugin safely
local mason_status, mason = pcall(require, "mason")
if not mason_status then
  return
end

-- import mason-lspconfig plugin safely
local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
  return
end

mason.setup({
  ensure_installed = {
    "mypy",
    "ruff",
    "pyright",
  },
})

mason_lspconfig.setup({
  -- list of servers for mason to install
  ensure_installed = {
    "cssls",
    "emmet_ls",
    "html",
    "lua_ls",
    "pyright",
    "tailwindcss",
    "ts_ls",
  },
})
