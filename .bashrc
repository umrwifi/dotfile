#[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export CLICOLOR=1
export EDITOR="nvim"	
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
alias v=/usr/bin/vim
alias vi="nvim"
alias vim="nvim"
alias brew="ss brew"
alias ss="ALL_PROXY=socks5://127.0.0.1:1080"
alias disproxy='unset http_proxy https_proxy '
alias tmux="tmux -2"
#alias w32="export WINEARCH=wine export WINEPREFIX="$HOME/.wine32"&& env LC_ALL=ja_JP.utf-8 wine"
alias x86="export WINEARCH=wine export WINEPREFIX="$HOME/.wine"; wine"
alias winjp="env LC_ALL=ja_JP.utf-8 "
#alias cpp="pbpaste>a.c|gcc a.c&&./a.out"
alias tx="tmuxinator"
alias tl="tmuxinator list"
alias to="tmuxinator open"
alias ts="tmuxinator start"
alias sed="gsed"
alias vimrc="nvim  -c 'cd ~/.config/nvim' -c 'e init.vim' "
alias fix-spotlight='find . -type d -name "node_modules" -exec touch "{}/.metadata_never_index" \;'
## app
alias skhdrc="cd ~/.config/skhd;vim skhdrc"
alias yabairc="cd ~/.config/yabai;vim yabairc"
alias mangamode="sudo bash ~/shells/rotatescreen.sh 90"
alias resetscreen="sudo bash ~/shells/rotatescreen.sh 0"
alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs"
sleep(){
  cmd="pmset sleepnow"
eval "${cmd}"
}
alias md="~/Documents/shells/md.sh"
hack(){
  if [[ $# == 0 ]]
  then
    nvim ~/Documents/hack
  else
    nvim -c "cd ~/Documents/hack" ~/Documents/hack/$*.md
  fi
}

vnote(){
  if [[ $# == 0 ]]
  then
    nvim ~/Documents/ -c "cd ~/Documents "
  else
    nvim -c "cd ~/Documents" ~/Documents/org/$*.md
  fi
}
alias vn="vnote"
export PATH=/usr/local/Cellar/python@3.9/3.9.0/bin/:$PATH
export LANG="en_GB.UTF-8"
#todo add /usr/local/etc to path
