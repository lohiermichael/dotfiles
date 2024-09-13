local harpoon_status, harpoon = pcall(require, "harpoon")
if not harpoon_status then
  return
end

-- Setup Harpoon
harpoon:setup()

local keymap = vim.keymap -- for conciseness

keymap.set(
  "n", "<leader>a",
  function() harpoon:list():add() end
)

keymap.set(
  "n", "<leader>lh",
  function() harpoon.ui:toggle_quick_menu(harpoon:list()) end
)

keymap.set(
  "n", "<leader><Tab>p",
  function() harpoon:list():prev() end
)

keymap.set(
  "n", "<leader><Tab>n",
  function() harpoon:list():next() end
)
