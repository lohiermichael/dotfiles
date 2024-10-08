-- import nvim-cmp plugin safely
local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
  return
end

-- import luasnip plugin safely
local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
  return
end

-- import lspkind plugin safely
local lspkind_status, lspkind = pcall(require, "lspkind")
if not lspkind_status then
  return
end

-- import lspconfig plugin safely
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
  return
end

luasnip.filetype_extend("javascriptreact", { "html" })
luasnip.filetype_extend("typescriptreact", { "html" })

-- load vs-code like snippets from plugins (e.g. friendly-snippets)
require("luasnip/loaders/from_vscode").lazy_load()

vim.opt.completeopt = "menu,menuone,noselect"

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    -- previous suggestion
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    -- next suggestion
    ["<C-j>"] = cmp.mapping.select_next_item(),
    -- TODO: fix, not working
    -- ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    -- ["<C-f>"] = cmp.mapping.scroll_docs(4),
    -- show completion suggestions
    ["<C-Space>"] = cmp.mapping.complete(),
    -- close completion window
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
  }),
  -- sources for autocompletion
  sources = cmp.config.sources({
    -- lsp
    { name = "nvim_lsp" },
    -- snippets
    { name = "luasnip" },
    -- text within current buffer
    { name = "buffer" },
    -- file system paths
    { name = "path" },
    -- Emmet completions for HTML, JSX and TSX
    { name = "emmet" },
  }),
  -- configure lspkind for vs-code like icons
  formatting = {
    format = lspkind.cmp_format({
      maxwidth = 50,
      ellipsis_char = "...",
    }),
  },
})

-- Enable for HTML, JSX, TSX
lspconfig.emmet_ls.setup({
  filetypes = {
    "html",
    "css",
    "javascriptreact",
    "typescriptreact"
  },
})
