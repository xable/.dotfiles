local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end

return require('packer').startup(function()
  -- Packer can manage itself
    use 'wbthomason/packer.nvim'

  -- LSP
    use {
    'neovim/nvim-lspconfig',
    config = function() require('config.lsp-config') end,
    }

    use {
    'williamboman/nvim-lsp-installer',
    config = function() require('config.lsp-installer') end,
    }

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
      require 'colorizer'.setup()
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
      requires = { 'kyazdani42/nvim-web-devicons' },
      config = function() require('config.bufferline') end,
    }

  -- comment
    use {
      'numToStr/Comment.nvim',
      config = function() require('config.comment') end,
    }

end)