"                      _
"   ___  ___ ___ _  __(_)_ _ / _ \/ -_) _ \ |/ / /  ' \ /_//_/\__/\___/___/_/_/_/_/
"

" ------------------------------------------------------------------------------
" Fun stuff -----------------------------------------------------------------------------

" Automatically install vim-plug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Automatically reload configuration on save
augroup AutoReloadConfig
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

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
            \    --no-bash --no-fish
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

" ------------------------------------------------------------------------------
" General Key Mappings
" ------------------------------------------------------------------------------

augroup signify_group
    autocmd!
    " Automatically refresh signify on buffer enter
    autocmd bufenter * :SignifyRefresh
augroup END

" Leader mappings
let mapleader="\<space>"
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>d :bp\|bd #<cr>
nnoremap <leader>f :Files<cr>
nnoremap <leader>g :GFiles<cr>
nnoremap <leader>h :History<cr>
nnoremap <leader>r :Rg<cr>
nnoremap <silent> <leader>w :wa<cr>
nnoremap <silent> <leader>c :noh<cr>
nnoremap <bs> <c-^>
nnoremap <leader>= mfggVG=`fzz

" Make Y more consistent
nnoremap Y y$

" Trim whitespace
nnoremap <silent> <F9> :let _s=@/ <Bar> :%s/\s\+$//e <Bar>
            \ :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

" ------------------------------------------------------------------------------
" Global Configuration
" ------------------------------------------------------------------------------

" Set pythonx version
set pyxversion=3

" Syntax Highlighting
syntax on

" Line numbers
set number

" Try to show paragraph's last line
set display+=lastline

" Always show sign column
set signcolumn=yes

" Keep lines above and below cursor
set scrolloff=1

" Theme
set termguicolors
colorscheme yami

" Allow multiple unsaved buffers
set hidden

" Natural splits
set splitbelow
set splitright

" Correctly setup tab and space behavior
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab

" round to nearest multiple of shiftwidth
set shiftround

" Saner line joins
set formatoptions+=j

" Use system clipboard
set clipboard=unnamedplus

" Don't update screen during macro and script execution
set lazyredraw

" Searching stuff
set ignorecase
set smartcase
set incsearch

set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c
