-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use {'wbthomason/packer.nvim', opt = true}    -- plugin manager

  -- Plugins --
  use 'rstacruz/vim-closer'                     -- auto insert brackets
  use 'cocopon/iceberg.vim'                     -- theme
  use 'justinmk/vim-dirvish'                    -- navigation
  use 'kristijanhusak/vim-dirvish-git'
  use 'wellle/targets.vim'                      -- additional text objects
  use 'yggdroot/indentLine'                     -- indentation tracking
  use 'mhinz/vim-signify'                       -- git signs
  use 'tpope/vim-commentary'                    -- comments
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
        {'hrsh7th/vim-vsnip'},
        {'hrsh7th/vim-vsnip-integ'},
        {'neovim/nvim-lspconfig'}
    }
  }
  use {
    'nvim-treesitter/nvim-treesitter',          -- syntax highlighting
    run = [[:TSUpdate]]
  }
end)
