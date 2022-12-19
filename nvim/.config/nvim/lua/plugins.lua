local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)

  -- Packer can manage itself
    use 'wbthomason/packer.nvim'

  -- LSP
    use {
    'neovim/nvim-lspconfig',
    config = function() require('config.lsp-config') end,
    }

    use { 'williamboman/mason.nvim',
    config = function() require('config.mason') end,
    }
    use { "williamboman/mason-lspconfig.nvim" }

  -- completion
    use {
    'hrsh7th/nvim-cmp',
    config = function() require('config.cmp') end,
    }
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'antoinemadec/FixCursorHold.nvim'

  -- snippets
    use 'L3MON4D3/LuaSnip'
    use "saadparwaiz1/cmp_luasnip"
    use "rafamadriz/friendly-snippets"

  -- file manager
    use {
      'kyazdani42/nvim-tree.lua',
      config = function() require('config.nvimtree') end,
      requires = 'kyazdani42/nvim-web-devicons',
    }

  -- statusline
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons' },
      config = function() require('config.lualine') end,
    }

  -- color highlighter
    use {
      'norcalli/nvim-colorizer.lua',
      config = function() require('config.colorizer') end,
    }

  -- treesitter
    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      config = function() require('config.treesitter') end,
    }

  -- telescope
    use {
      'nvim-telescope/telescope.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
      config = function() require('config.telescope') end,
    }

    use {
    'nvim-telescope/telescope-fzf-native.nvim', run = 'make'
    }

  -- dashboard
    use {
      'glepnir/dashboard-nvim',
      config = function() require('config.dashboard') end,
    }

  -- web devicons
    use {
      'kyazdani42/nvim-web-devicons',
      config = function() require('config.web-devicons') end,
    }

  -- hop
    use {
      'phaazon/hop.nvim',
      config = function() require('config.hop') end,
    }

  -- bufferline
    use {
      'akinsho/bufferline.nvim',
      tag = "*",
      requires = { 'kyazdani42/nvim-web-devicons' },
      config = function() require('config.bufferline') end,
    }

  -- comment
    use {
      'numToStr/Comment.nvim',
      config = function() require('config.comment') end,
    }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
