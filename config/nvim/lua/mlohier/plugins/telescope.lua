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
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--hidden',        -- Search hidden files
      '--no-ignore',     -- Include files ignored by .gitignore
      '--glob', '!.git/',          -- Exclude .git directory
      '--glob', '!venv/',          -- Exclude venv directory
      '--glob', '!node_modules/',  -- Exclude node_modules directory
    },
  },
  pickers = {
    find_files = {
      hidden = true,  -- Show hidden files
      find_command = {
        'rg',
        '--files',
        '--hidden',
        '--no-ignore',
        '--glob', '!.git/',
        '--glob', '!venv/',
        '--glob', '!node_modules/',
      },  -- Use ripgrep with `--no-ignore`
    },
  },
})

telescope.load_extension("fzf")
