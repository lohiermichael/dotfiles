-- import lspconfig plugin safely
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
  return
end

-- import cmp-nvim-lsp plugin safely
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
  return
end

local keymap = vim.keymap -- for conciseness

-- enable keybinds only for when lsp server available
local on_attach = function(client, bufnr)
  -- keybind options
  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- set keybinds
  -- show definition, references
  keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts)
  -- go to definition
  keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  -- see definition and make edits in window (peek)
  keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<CR>", opts)
  -- go to implementation
  keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  -- see available code actions
  keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
  -- smart rename
  keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
  -- show  diagnostics for line
  keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
  -- show diagnostics for cursor
  keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
  -- jump to previous diagnostic in buffer
  keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
  -- jump to next diagnostic in buffer
  keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
  -- show documentation for what is under cursor
  keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
  -- see outline on right hand side
  keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts)
end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- configure css server
lspconfig["cssls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    css = { validate = true,
      lint = {
        unknownAtRules = "ignore"
      }
    },
    scss = { validate = true,
      lint = {
        unknownAtRules = "ignore"
      }
    },
    less = { validate = true,
      lint = {
        unknownAtRules = "ignore"
      }
    },
  }
})

-- configure html server
lspconfig["html"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig["jsonls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configure Python server: pyright
lspconfig["pyright"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configure typescript server with plugin
lspconfig["ts_ls"].setup({
  init_options = {
    preferences = {
      importModuleSpecifierPreference = "non-relative",
    },
  },
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json"),
  single_file_support = true,
  capabilities = capabilities,
  on_attach = on_attach,
})
