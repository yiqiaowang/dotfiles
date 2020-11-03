-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  
  use {'wbthomason/packer.nvim', opt = true}    -- plugin manager

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
    'junegunn/fzf.vim',                         -- fuzzy search
    requires = {
      { 'junegunn/fzf',
        run = [[:call fzf#install()]] },
    }
  }
  use 'sheerun/vim-polyglot'                    -- language multipack
  use {                                         -- completion
    'nvim-lua/completion-nvim', opt = true,
    requires = {{'hrsh7th/vim-vsnip', opt = true},
                {'hrsh7th/vim-vsnip-integ', opt = true},
                {'neovim/nvim-lspconfig', opt = true}}
  }
end)
