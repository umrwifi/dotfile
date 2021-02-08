#[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export CLICOLOR=1
export EDITOR="nvim"	
# bindkey '^p' up-line-or-search
# bindkey '^n' down-line-or-search
o(){
  if [  -n "$1" ] 
  then
    ll="$*"
    eval "open ${ll} " 
  else
    ll=" ."
    eval "open ${ll}"
  fi
}

zo(){
  if [  -n "$1" ] 
  then
    ll="$*"
    eval "z ${ll} ; open . " 
  fi
}
cps(){
 cp ./$* 
}
alias v=/usr/bin/vim
alias vi="nvim"
alias vim="nvim"
alias brew="ss brew"
alias em="/usr/local/Cellar/emacs/26.3/bin/emacs -nw"
alias ss="ALL_PROXY=socks5://127.0.0.1:1080"
alias disproxy='unset http_proxy https_proxy '
alias tmux="tmux -2"
alias w32="export WINEARCH=wine export WINEPREFIX="$HOME/.wine32"&& env LC_ALL=ja_JP.utf-8 wine"
alias x86="export WINEARCH=wine export WINEPREFIX="$HOME/.wine"; wine"
alias winjp="env LC_ALL=ja_JP.utf-8 "
alias cpp="pbpaste>a.c|gcc a.c&&./a.out"
alias tl="tmuxinator list"
alias to="tmuxinator open"
alias ts="tmuxinator start"
alias vimrc="nvim  -c 'cd ~/.config/nvim' -c 'e init.vim' "
## app
alias skhdrc="z skhd;vim ~/.config/skhd/skhdrc"
alias yabairc="z yabai;vim ~/.config/yabai/yabairc"

#alias rm='trash'
sleep(){
  cmd="pmset sleepnow"
eval "${cmd}"
}
alias md="~/Documents/shells/md.sh"
td(){
  if [[ $# == 0 ]]
  then
    nvim -c 'cd ~/Documents/Todo'  -c 'e inbox.md'  -c 'normal! G'  -c 'startinsert'
  else 
    echo  $* | pbcopy
    nvim -c 'cd ~/Documents/Todo'  -c 'e inbox.md'  -c 'normal! Gp' 
  fi
}
hack(){
  if [[ $# == 0 ]]
  then
    nvim ~/Documents/hack
  else
    nvim -c "cd ~/Documents/hack" ~/Documents/hack/$*.md
  fi
}
export PATH=/usr/local/Cellar/python@3.9/3.9.0/bin/:$PATH
export LANG="en_GB.UTF-8"
#todo add /usr/local/etc to path
