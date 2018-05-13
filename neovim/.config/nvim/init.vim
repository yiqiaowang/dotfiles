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

Plug 'Yggdroot/indentline'              " highlight indent levels
Plug 'mhartington/oceanic-next'         " theme
Plug 'mhinz/vim-startify'               " nice startup page
Plug 'vim-airline/vim-airline'          " statusline
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
Plug 'honza/vim-snippets'               " snippet sources
Plug 'tpope/vim-commentary'		" comment helper
Plug 'tpope/vim-eunuch'		        " unix commands helper
Plug 'tpope/vim-repeat'                 " repeat plugin maps
Plug 'tpope/vim-surround'		" quoting/paren etc. helper
Plug 'tpope/vim-unimpaired'		" bracket mappings
Plug 'lambdalisue/gina.vim'             " async git
Plug 'mhinz/vim-signify'                " visualize vcs changes
Plug 'justinmk/vim-dirvish'             " netrw replacement
Plug 'w0rp/ale'				" linter
Plug 'sheerun/vim-polyglot'             " language pack
Plug 'Shougo/deoplete.nvim', {
    \ 'do': ':UpdateRemotePlugins'
    \ }                                 " completions
Plug 'christoomey/vim-tmux-navigator'   " tmux

Plug 'slashmili/alchemist.vim'          " elixir support
Plug 'mhinz/vim-mix-format'

call plug#end()

" ------------------------------------------------------------------------------
" Key bindings
" ------------------------------------------------------------------------------
let mapleader="\<Space>"
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>h :History<cr>
nnoremap <leader>f :Files<cr>
nnoremap <leader>g :GFiles<cr>
nnoremap <leader>d :bp\|bd #<cr>
nnoremap <leader>- :new<cr>
nnoremap <leader>\ :vnew<cr>

nnoremap <bs> <c-^>

nnoremap <c-right> 10<c-w>>
nnoremap <c-up>    5<c-w>+
nnoremap <c-down>  5<c-w>-
nnoremap <c-left>  10<c-w><

nnoremap Y y$

" Trim whitespace
nnoremap <silent> <f5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar>
    \ :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

" ------------------------------------------------------------------------------
" Configuration
" ------------------------------------------------------------------------------

syntax on                                " Syntax Highlighting
set number                               " Line numbers

set termguicolors                        " Theme
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
colorscheme OceanicNext

set hidden                               " Allow multiple unsaved buffers

set splitbelow                           " Split below
set splitright                           " Split right

set tabstop=8                            " Correctly setup tab and space behavior
set softtabstop=4
set shiftwidth=4
set expandtab

set formatoptions+=j                     " Saner line joins

let g:indentLine_char = ''              " Indentline
let g:indentLine_first_char = ''
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0

let g:deoplete#enable_at_startup = 1     " deoplete
let g:deoplete#enable_ignore_case = 1
let g:deoplete#auto_complete_start_length = 1
call deoplete#custom#source('_', 'matchers', ['matcher_fuzzy'])
call deoplete#custom#source('ultisnips', 'matchers', ['matcher_full_fuzzy'])

let g:UltiSnipsExpandTrigger = "<c-j>"   " ultisnips
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
imap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
imap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
inoremap <c-x><c-k> <c-x><c-k>

let g:tmux_navigator_no_mappings = 1     " vim-tmux-navigator
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-bs> :TmuxNavigatePrevious<cr>

let g:ale_sign_column_always = 1         " ale

let g:airline#extensions#ale#enabled = 1 " airline
let g:airline_theme = 'oceanicnext'
let g:airline_powerline_fonts = 1
" Fix Konsole font rendering issue
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.maxlinenr = ' '
" Use gina.vim for branch info
let g:airline_section_b = '%-0.10{gina#component#repo#branch()}'

let g:signify_vcs_list = ['git']        " signify

let g:loaded_netrwPlugin = 1            " dirvish
command! -nargs=? -complete=dir Explore Dirvish <args>
command! -nargs=? -complete=dir Sexplore belowright split | silent Dirvish <args>
command! -nargs=? -complete=dir Vexplore leftabove vsplit | silent Dirvish <args>
