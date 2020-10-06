# export PATH=$PATH:/usr/local/mysql/bin
export CLICOLOR=1
export EDITOR="nvim"	
bindkey '^' autosuggest-execute
# bindkey '^p' up-line-or-search
# bindkey '^n' down-line-or-search
openRefactor(){
  if [  -n "$1" ] 
  then
    ll="$*"
    eval "open ${ll}" 
  else
    ll=" ."
    eval "open ${ll}"
  fi
}
alias vi="nvim"
alias o="openRefactor"
alias clash="bash ~/shell/clash.sh"
alias brew="ss brew"
alias em="/usr/local/Cellar/emacs/26.3/bin/emacs -nw"
alias ss="ALL_PROXY=socks5://127.0.0.1:1080"
alias disproxy='unset http_proxy https_proxy '
alias tmux="tmux -2"
alias w32="export WINEARCH=win32 export WINEPREFIX="$HOME/.wine32"&& env LC_ALL=ja_JP.utf-8 wine"
alias x86="export WINEARCH=win64 export WINEPREFIX="$HOME/.wine"; wine"
alias winjp="env LC_ALL=ja_JP.utf-8 "
alias cpp="pbpaste>a.c|gcc a.c&&./a.out"
alias wiki="vi ~/Documents/wiki/todo.md -c 'cd ~/Documents/wiki' "
sleep(){
  cmd="pmset sleepnow"
eval "${cmd}"
}
alias md="~/Documents/shells/md.sh"
alias ww='vi ~/iCloud/Documents/wiki/todo.md -c"lcd %:p:h"'
todo(){
  if [[ $# == 0 ]]
  then
    cat ~/Documents/wiki/dpca/todo.md|grep "\- \[\ \]"
#  else
#    echo "$*" >> ~/Documents/wiki/dpca/todo.md
#    echo  task add success
  fi
}

