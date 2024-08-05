-- import telescope plugin safely
local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
  return
end

-- import telescope actions safely
local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
  return
end

-- configure telescope
telescope.setup({
  -- configure custom mappings
  defaults = {
    mappings = {
      i = {
        -- move to prev result
        ["<C-k>"] = actions.move_selection_previous,

        -- move to next result
        ["<C-j>"] = actions.move_selection_next,
      },
    },
  },
  pickers = {
    find_files = {
      hidden = true,  -- Show hidden files
      find_command = { 'rg', '--files', '--hidden', '--no-ignore' },  -- Use ripgrep with `--no-ignore`
    },
  },
  defaults = {
    file_ignore_patterns = {},  -- No custom ignore patterns
  },
})

telescope.load_extension("fzf")
