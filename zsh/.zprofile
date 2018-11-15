# Plugins
[ -f ~/.zsh-plugins/zsh-nvm/zsh-nvm.plugin.zsh ] && source ~/.zsh-plugins/zsh-nvm/zsh-nvm.plugin.zsh

# Fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# elixir-ls
[ -f ~/build/elixir-ls_release/language_server.sh ] && PATH=$PATH:~/build/elixir-ls_release

# Export path
export PATH

GPG_TTY=$(tty)
export GPG_TTY
