setopt PROMPT_SUBST
function () {
  if [[ -n "$TMUX$ZELLIJ" ]]; then
    local LVL=$(($SHLVL - 1))
  else
    local LVL=$SHLVL
  fi
  local SUFFIX=$(printf '\$%.0s' {1..$LVL})
  ZLE_RPROMPT_INDENT=0
  PS1="%F{green}${SSH_TTY:+%n@%m}%f%B${SSH_TTY:+:}%b%F{yellow}%B%(1j.*.)%(?..!)%b%f%F{red}%B${SUFFIX}%b%f "
}
RPROMPT="%F{blue}%~%f"

LANG=en_GB.UTF-8 LC_CTYPE="en_GB.UTF-8"

EDITOR='nvim'
bindkey -v
KEYTIMEOUT=1
autoload -Uz surround
zle -N delete-surround surround
zle -N add-surround surround
zle -N change-surround surround
bindkey -M vicmd cs change-surround
bindkey -M vicmd ds delete-surround
bindkey -M vicmd ys add-surround
bindkey -M visual S add-surround
bindkey -M viins '^k' up-line-or-history
bindkey -M viins '^j' down-line-or-history
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init

HISTFILE="$HOME/.zsh_history"
HISTSIZE=3000000
SAVEHIST=2000000
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

PATH=$PATH:$HOME/.cargo/bin/

alias nvi='nvim'
alias vi='nvim'
alias vim='nvim'
alias v='vi'

alias ..='cd ..'
alias ...='cd ....'
alias ....='cd ......'

alias httpie='http'
alias h='http'
alias g='git'
alias ls='eza'
alias l='ls'
alias c='cargo'
alias d='docker'
alias dc='docker-compose'
alias t='terraform'
alias k='kubectl'
alias cat='bat'
alias du='dust'
alias top='zenith'

[ -f ~/.zshrc-secrets ] && source ~/.zshrc-secrets

if [ -x "$(command -v mise)" ]; then
  eval "$(mise activate zsh)"
fi
if [ -x "$(command -v zoxide)" ]; then
  eval "$(zoxide init zsh)"
fi
if [ -x "$(command -v fzf)" ]; then
  source <(fzf --zsh)
fi

autoload -Uz compinit; compinit
