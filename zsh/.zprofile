# Plugins
[ -f ~/.zsh-plugins/zsh-nvm/zsh-nvm.plugin.zsh ] && source ~/.zsh-plugins/zsh-nvm/zsh-nvm.plugin.zsh

# Fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# vcpkg
[ -d ~/.vcpkg ] && PATH=$PATH:~/.vcpkg

# local bin
[ -d ~/.local/bin ] && PATH=$PATH:~/.local/bin

# Export path
export PATH

# Give gpg-agent the correct startup tty
echo UPDATESTARTUPTTY | gpg-connect-agent &> /dev/null
