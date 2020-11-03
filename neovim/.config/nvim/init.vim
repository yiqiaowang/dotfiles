" ------------------------------------------------------------------------------
" Bootstrap
" ------------------------------------------------------------------------------
" {{{

" Automatically install packer.nvim if it does not exist
if empty(glob('~/.local/share/nvim/site/pack/packer/opt/packer.nvim'))
    silent !git clone https://github.com/wbthomason/packer.nvim
    \ ~/.local/share/nvim/site/pack/packer/opt/packer.nvim
endif
" }}}


colorscheme iceberg
packadd vim-polyglot
syntax on
  
let mapleader="\<space>"

" Source lua/plugins.lua
lua require('plugins')
lua require('settings')
