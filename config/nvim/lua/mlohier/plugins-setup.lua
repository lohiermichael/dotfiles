-- from: https://github.com/wbthomason/packer.nvim
-- auto install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system(
      {
        "git", "clone", "--depth", "1",
        "https://github.com/wbthomason/packer.nvim", install_path
      }
    )
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads Neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
  return
end

-- add list of plugins to install
return packer.startup(function(use)

  -- packer can manage itself
  use("wbthomason/packer.nvim")

  -- lua functions that many plugins use
  use("nvim-lua/plenary.nvim")

  -- color scheme
  use("bluz71/vim-nightfly-guicolors")

  -- tmux and split window navigator
  use("christoomey/vim-tmux-navigator")

  -- maximizes and restores current window
  use("szw/vim-maximizer")

  -- essential plugins
  use("tpope/vim-surround")
  use("vim-scripts/ReplaceWithRegister")

  -- comment
  use("numToStr/Comment.nvim")
  -- TypeScript comments
  use('JoosepAlviste/nvim-ts-context-commentstring')

  -- file explorer
  use("nvim-tree/nvim-tree.lua")

  -- vs-code like icons
  use("nvim-tree/nvim-web-devicons")

  -- statusline
  use("nvim-lualine/lualine.nvim")

  -- fuzzy finding w/ telescope
  -- dependency for better sorting performance
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
  -- fuzzy finder
  use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })

  -- Emmet
  -- Emmet plugin
  use("mattn/emmet-vim")
  -- Emmet server
  use("aca/emmet-ls")

  -- autocompletion
  -- completion plugin
  use("hrsh7th/nvim-cmp")
  -- source for text in buffer
  use("hrsh7th/cmp-buffer")
  -- source for file system paths
  use("hrsh7th/cmp-path")

  -- snippets
  -- snippet engine
  use("L3MON4D3/LuaSnip")
  -- for autocompletion
  use("saadparwaiz1/cmp_luasnip")
  -- useful snippets
  use("rafamadriz/friendly-snippets")

  -- managing & installing lsp servers, linters & formatters
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")

  -- configuring lsp servers
  -- easily configure language servers
  use("neovim/nvim-lspconfig")
  -- for autocompletion
  use("hrsh7th/cmp-nvim-lsp")
  -- enhanced lsp uis
  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    requires = {
      { "nvim-tree/nvim-web-devicons" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  })
  -- vs-code like icons for autocompletion
  use("onsails/lspkind.nvim")

  use({
    "jose-elias-alvarez/null-ls.nvim",
    ft = { "python" },
  })

  -- treesitter configuration
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update(
        { with_sync = true }
      )
      ts_update()
    end,
  })

  -- auto closing
  -- auto-close parentheses, brackets, quotes, etc...
  use("windwp/nvim-autopairs")
  -- auto-close tags
  use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" })

  -- git integration
  -- show line modifications on left hand side
  use("lewis6991/gitsigns.nvim")

  -- Markdown Preview plugin
  use({
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
    ft = { "markdown" },
  })

  use({
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    requires = {"nvim-lua/plenary.nvim"},
  })

  if packer_bootstrap then
    require("packer").sync()
  end
end)
