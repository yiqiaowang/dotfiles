-- Package management using packer.nvim (https://github.com/wbthomason/packer.nvim)

local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end


-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]

require('packer').startup(function()
  use {'wbthomason/packer.nvim', opt = true}    -- plugin manager

  -- Plugins --
  use 'wellle/targets.vim'                      -- additional text objects
  use 'yggdroot/indentLine'                     -- indentation tracking
  use 'christoomey/vim-tmux-navigator'          -- tmux integration
  use {
    'nvim-telescope/telescope.nvim',            -- fuzzy finder
    requires = {
        {'nvim-lua/popup.nvim'},
        {'nvim-lua/plenary.nvim'}
    }
  }
  use 'sheerun/vim-polyglot'                    -- language multipack
  use {                                         -- completion
    'hrsh7th/nvim-compe',
    requires = {
        {'neovim/nvim-lspconfig'},
        {'hrsh7th/vim-vsnip'},
        {'hrsh7th/vim-vsnip-integ'}
    }
  }
  use {
    'nvim-treesitter/nvim-treesitter',          -- syntax highlighting
    run = [[:TSUpdate]]
  }
  use {
    'puremourning/vimspector',
    requires = {
        {'nvim-lua/popup.nvim'},
        {'nvim-lua/plenary.nvim'},
        {'nvim-telescope/telescope.nvim'},
        {'nvim-telescope/telescope-vimspector.nvim'}
    }
  }
  use 'b3nj5m1n/kommentary'
  use 'TimUntersberger/neogit'
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('gitsigns').setup()
    end
  }
  use {
	  'kyazdani42/nvim-tree.lua',
	  requires = {
		  'kyazdani42/nvim-web-devicons'
	  }
  }
end)



--- Plugin configurations
require('plugins.telescope')
require('plugins.nvim-compe')
require('plugins.lspconfig')
require('plugins.treesitter')
require('plugins.vimspector')
require('plugins.nvim-tree')
require('plugins.neogit')
require('plugins.nvim-tree')