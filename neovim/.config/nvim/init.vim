"                      _
"   ___  ___ ___ _  __(_)_ _
"  / _ \/ -_) _ \ |/ / /  ' \
" /_//_/\__/\___/___/_/_/_/_/
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
Plug 'RRethy/vim-illuminate'                " highlights word under cursor
Plug 'Yggdroot/indentline'                  " highlight indent levels
Plug 'yiqiaowang/inkpot'                    " theme
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
Plug 'tpope/vim-eunuch'                     " unix commands helper
Plug 'tpope/vim-repeat'                     " repeat plugin maps
Plug 'tpope/vim-surround'                   " quoting/paren etc. helper
Plug 'tpope/vim-unimpaired'                 " bracket mappings
Plug 'simeji/winresizer'                    " resize windows

" language support
Plug 'honza/vim-snippets'                   " snippet sources
Plug 'sheerun/vim-polyglot'                 " language pack
Plug 'SirVer/ultisnips'                     " snippet engine
Plug 'autozimu/LanguageClient-neovim', {
            \ 'branch': 'next',
            \ 'do': 'bash install.sh',
            \ }                             " language server
Plug 'ncm2/ncm2'                            " autocomplete
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-ultisnips'

" source control
Plug 'lambdalisue/gina.vim'                 " async git
Plug 'mhinz/vim-signify'                    " visualize vcs changes
call plug#end()

" ------------------------------------------------------------------------------ Key bindings
" ------------------------------------------------------------------------------

" Leader mappings
let mapleader="\<space>"
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>d :bp\|bd #<cr>
nnoremap <leader>f :Files<cr>
nnoremap <leader>g :GFiles<cr>
nnoremap <leader>h :History<cr>
nnoremap <leader>r :Rg<cr>
nnoremap <leader>s :Snippets<cr>
nnoremap <silent> <leader>w :wa<cr>:SignifyRefresh<cr>
nnoremap <silent> <leader>c :noh<cr>
nnoremap <bs> <c-^>
nnoremap <leader>= mfggVG=`fzz

" Make Y more consistent
nnoremap Y y$

" Trim whitespace
nnoremap <silent> <F9> :let _s=@/ <Bar> :%s/\s\+$//e <Bar>
            \ :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

" ------------------------------------------------------------------------------
" Configuration
" ------------------------------------------------------------------------------

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
colorscheme inkpot

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

" Indentline
let g:indentLine_char = '▏'

" ncm2
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
set pumheight=10

inoremap <c-c> <ESC>
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
inoremap <expr> <Tab> (pumvisible() ? "\<C-n>" : "\<Tab>")
inoremap <expr> <S-Tab> (pumvisible() ? "\<C-p>" : "\<S-Tab>")
inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')

" ultisnips
imap <c-u> <Plug>(ultisnips_expand)
let g:UltiSnipsExpandTrigger		= "<Plug>(ultisnips_expand)"
let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0

" eleline
let g:eleline_powerline_fonts = 1 

" signify
let g:signify_vcs_list = ['git']

" dirvish
let g:loaded_netrwPlugin = 1
command! -nargs=? -complete=dir Explore Dirvish <args>
command! -nargs=? -complete=dir Sexplore belowright split | silent Dirvish <args>
command! -nargs=? -complete=dir Vexplore leftabove vsplit | silent Dirvish <args>

" language client neovim
let g:LanguageClient_serverCommands = {
            \ 'elixir': ['language_server.sh'],
            \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>


let g:LanguageClient_diagnosticsDisplay = {
            \ 1: {
            \  "name": "Error",
            \ "texthl": "ALEError",
            \ "signText": "!!",
            \ "signTexthl": "ALEErrorSign",
            \ },
            \ 2: {
            \ "name": "Warning",
            \ "texthl": "ALEWarning",
            \ "signText": "**",
            \ "signTexthl": "ALEWarningSign",
            \ },
            \ 3: {
            \ "name": "Information",
            \ "texthl": "ALEInfo",
            \ "signText": "--",
            \ "signTexthl": "ALEInfoSign",
            \ },
            \ 4: {
            \ "name": "Hint",
            \ "texthl": "ALEInfo",
            \ "signText": ">>",
            \ "signTexthl": "ALEInfoSign",
            \ }}

" fzf.vim
let g:fzf_colors = {
            \ 'fg':      ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Comment'],
            \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+':     ['fg', 'Statement'],
            \ 'info':    ['fg', 'PreProc'],
            \ 'border':  ['fg', 'Ignore'],
            \ 'prompt':  ['fg', 'Conditional'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'] }

" ripgrep with preview
command! -bang -nargs=* Rg
            \ call fzf#vim#grep(
            \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
            \   <bang>0 ? fzf#vim#with_preview('up:60%')
            \           : fzf#vim#with_preview('right:50%:hidden', '?'),
            \   <bang>0)

" Files command with preview window
command! -bang -nargs=? -complete=dir Files
            \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
" GFiles command with preview window
command! -bang -nargs=? -complete=dir GFiles
            \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview(), <bang>0)
