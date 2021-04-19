## zshrc
ZSH_DISABLE_COMPFIX=true
export ZSH="/Users/admin/.oh-my-zsh"
ZSH_THEME="mini"
TERM=xterm-256color
autoload colors
plugins=( 
  git 
  z 
  zsh-autosuggestions 
  zsh-syntax-highlighting
  zsh-completions
)
function quick-look() {
  (( $# > 0 )) && qlmanage -p $* &>/dev/null &
}
# tab complete:
# autoload -U compinit
# zstyle ':completion:*' menu select
# zmodload zsh/complist
# vi mode
bindkey -v
export KEYTIMEOUT=1
autoload edit-command-line; zle -N edit-command-line
bindkey '^i' edit-command-line
source $ZSH/oh-my-zsh.sh
# Use vim keys in tab complete menu:
zstyle ':completion:*' menu select
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey '^V' autosuggest-accept
# bindkey '^f' autosuggest-execute
source ~/.bashrc
# fzf keybinding
source ~/key-bindings.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND="rg --files --hidden -g'!.git'"
#export FZF_DEFAULT_OPTS="--height 60% --layout=reverse"
