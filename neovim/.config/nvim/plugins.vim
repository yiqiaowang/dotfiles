" ------------------------------------------------------------------------------
" Plugins
" ------------------------------------------------------------------------------
call plug#begin('~/.local/share/nvim/vim-plug')

" cosmetics
Plug 'mhinz/vim-startify'                   " nice startup page
Plug 'Yggdroot/indentline'                  " highlight indent levels
Plug 'yiqiaowang/vim-yami'
Plug 'yiqiaowang/statusline'                " statusline

" utilites
Plug 'christoomey/vim-tmux-navigator'       " tmux
Plug 'junegunn/fzf', {
            \  'dir': '~/.fzf',
            \  'do': './install
            \    --no-fish --no-zsh
            \    --64 --key-bindings
            \    --completion
            \    --update-rc'
            \  }                            " fuzzyfinder
Plug 'junegunn/fzf.vim'                     " fzf integration
Plug 'junegunn/vim-easy-align'              " align stuff
Plug 'justinmk/vim-dirvish'                 " netrw replacement
Plug 'tpope/vim-commentary'                 " comment helper
Plug 'tpope/vim-repeat'                     " repeat plugin maps
Plug 'tpope/vim-surround'                   " quoting/paren etc. helper
Plug 'tpope/vim-unimpaired'                 " bracket mappings
Plug 'simeji/winresizer'                    " resize windows

" language support
Plug 'sheerun/vim-polyglot'                 " language pack
Plug 'liuchengxu/vista.vim'                 " modern tagline
Plug 'neoclide/coc.nvim', {                 
            \ 'tag': '*',
            \ 'do': { -> coc#util#install() }
            \ }                             " language server & completion

" source control
Plug 'mhinz/vim-signify'                    " visualize vcs changes
Plug 'lambdalisue/gina.vim'                 " async git
call plug#end()
