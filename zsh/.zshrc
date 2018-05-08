# yiqiaowang's zshrc

# configure the path & environment variables
typeset -U path
path=(~/.local/bin/ $path)

# Add rust to path
source $HOME/.cargo/env

# Aliases
alias ls='ls --color=auto'
alias ll='ls -lAh'

# zsh options
setopt PROMPT_SUBST
setopt GLOBDOTS

# autoloads
autoload colors zsh/terminfo

# Load colors
if [[ "$terminfo[colors]" -ge 8 ]]; then
   colors
fi
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
   eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
   eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
   (( count = $count + 1 ))
done

# Prompt
PR_NO_COLOR="%{$terminfo[sgr0]%}"
PS1='%(?..[${PR_LIGHT_RED}%?$PR_NO_COLOR])%(!.${PR_LIGHT_RED}#.${PR_LIGHT_GREEN}>) '
RPS1='%(!.${PR_RED}%3c.${PR_BLUE}%3c)$PR_NO_COLOR'

# Completion Settings & Options
autoload -Uz compinit && compinit
setopt complete_in_word
setopt auto_menu
setopt autocd

# Completion configuration
zstyle ':completion:*' menu select

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
