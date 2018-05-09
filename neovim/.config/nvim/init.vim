"                      _
"   ___  ___ ___ _  __(_)_ _
"  / _ \/ -_) _ \ |/ / /  ' \
" /_//_/\__/\___/___/_/_/_/_/
"

" ------------------------------------------------------------------------------
" Fun stuff
" ------------------------------------------------------------------------------

" Automatically install vim-plug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Automatically reload configuration on save
augroup AutoReloadConfig
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC | AirlineRefresh
augroup END

" ------------------------------------------------------------------------------
" Plugins
" ------------------------------------------------------------------------------
call plug#begin('~/.local/share/nvim/vim-plug')

Plug 'mhartington/oceanic-next'                " theme
Plug 'junegunn/fzf', {
    \  'dir': '~/.fzf',
    \  'do': './install
    \    --no-bash --no-fish
    \    --64 --key-bindings
    \    --completion
    \    --update-rc'
    \  }                                " fuzzyfinder
Plug 'junegunn/fzf.vim'                 " fzf integration
Plug 'junegunn/vim-easy-align'          " align stuff
Plug 'SirVer/ultisnips'                 " snippet engine
    \ | Plug 'honza/vim-snippets'       " snippet sources
Plug 'tpope/vim-commentary'		" comment helper
Plug 'tpope/vim-surround'		" quoting/paren etc. helper
Plug 'tpope/vim-eunuch'		        " unix commands helper
Plug 'tpope/vim-unimpaired'		" bracket mappings
Plug 'tpope/vim-fugitive'		" git wrapper
Plug 'mhinz/vim-signify'                " visualize vcs changes
Plug 'justinmk/vim-dirvish'             " netrw replacement
Plug 'Yggdroot/indentline'              " highlight indent levels
Plug 'w0rp/ale'				" linter
Plug 'sheerun/vim-polyglot'             " language pack
Plug 'tpope/vim-repeat'                 " repeat plugin maps
Plug 'vim-airline/vim-airline'          " statusline
Plug 'mhinz/vim-startify'               " nice startup page
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }                                 " language client
Plug 'Shougo/deoplete.nvim', {
    \ 'do': ':UpdateRemotePlugins'
    \ }                                 " completions

call plug#end()

" ------------------------------------------------------------------------------
" Configuration
" ------------------------------------------------------------------------------

" syntax highlighting
syntax on

" Theme
set termguicolors
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
colorscheme OceanicNext

" Allow multiple unsaved buffers
set hidden

" Split below and to the right
set splitbelow
set splitright

" Key bindings
nnoremap <BS> <C-^>

" Leader bindings
let mapleader="\<Space>"
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>d :bp\|bd #<CR>
nnoremap <Leader>- :Vexplore<CR>

" Resizing splits
nnoremap <C-Right> 10<C-w>>
nnoremap <C-Up>    5<C-w>+
nnoremap <C-Down>  5<C-w>-
nnoremap <C-Left>  10<C-w><

" Make Y behavior consistent
nnoremap Y y$

" Trim whitespace
nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar>
    \ :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

" Correctly setup tab and space behavior
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab

" indentline
let g:indentLine_char = ''
let g:indentLine_first_char = ''
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0

" language client
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'stable', 'rls']
    \ }
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" ale
let g:ale_sign_column_always = 1

" airline
let g:airline#extensions#ale#enabled = 1
let g:airline_theme = 'oceanicnext'
let g:airline_powerline_fonts = 1

" Fix konsole font rendering issue
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.maxlinenr = ' '

" signify
let g:signify_vcs_list = ['git']

" dirvish
let g:loaded_netrwPlugin = 1
command! -nargs=? -complete=dir Explore Dirvish <args>
command! -nargs=? -complete=dir Sexplore belowright split | silent Dirvish <args>
command! -nargs=? -complete=dir Vexplore leftabove vsplit | silent Dirvish <args>
