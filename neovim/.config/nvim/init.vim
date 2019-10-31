" ------------------------------------------------------------------------------
" Bootstrap
" ------------------------------------------------------------------------------

" Automatically install vim-plug if it does not exist
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


let g:nvim_home = get(g:, 'nvim_home', expand('~/.config/nvim/'))

" Run vim-plug
exec 'source' g:nvim_home.'plugins.vim'

" Load own configs
for f in glob(g:nvim_home.'config/*.vim', 1, 1)
    exec 'source' f
endfor
