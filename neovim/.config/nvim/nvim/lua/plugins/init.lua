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

return require('packer').startup(function()
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
    'nvim-lua/completion-nvim',
    requires = {
        {'neovim/nvim-lspconfig'}
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
end)



--- Plugin configurations
require(plugins.telescope)
require(plugins.completion_nvim)
require(plugins.lspconfig)
require(plugins.treesitter)
require(plugins.vimspector)