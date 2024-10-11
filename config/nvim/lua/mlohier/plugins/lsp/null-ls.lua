-- import mull plugin safely
local null_ls_status, null_ls = pcall(require, "null-ls")
if not null_ls_status then
  return
end

null_ls.seutp({
  sources = {
    null_ls.buitins.diagnostics.mypy,
    null_ls.buitins.diagnostics.ruff.with({
      extra_args = { "--select", "F841" }, -- Select unused variable rule
    }),
  },
})
