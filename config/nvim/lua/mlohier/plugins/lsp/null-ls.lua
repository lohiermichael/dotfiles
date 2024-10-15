-- import mull plugin safely
local null_ls_status, null_ls = pcall(require, "null-ls")
if not null_ls_status then
  return
end

null_ls.seutp({
  sources = {
    -- Add JSON formatting using prettier
    null_ls.builtins.formatting.prettier,
    -- Optionally add JSON diagnostics
    null_ls.builtins.diagnostics.jsonlint,
    null_ls.buitins.diagnostics.mypy,
    null_ls.buitins.diagnostics.ruff.with({
      extra_args = { "--select", "F841" }, -- Select unused variable rule
    }),
  },
})
