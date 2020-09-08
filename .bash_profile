export PATH=$PATH:/usr/local/mysql/bin
export JAVA_HOME="/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home"
export PATH="$PATH:$JAVA_HOME/bin"
export CLASSPATH="$JAVA_HOME/lib"
export CLICOLOR=1
export EDITOR="nvim"	
bindkey '^' autosuggest-execute
bindkey '^p' up-line-or-search
bindkey '^n' down-line-or-search
Sd() {
#  tmux source-file ~/.tmux/plugins/tmux-colors-solarized/tmuxcolors-dark.conf
  if [ -n "$ITERM_PROFILE" ]; then
    unset THEME
    export THEME=dark
    it2prof dark
    reload_profile
  fi
}

Sl() {
#  tmux source-file ~/.tmux/plugins/tmux-colors-solarized/tmuxcolors-light.conf
  if [ -n "$ITERM_PROFILE" ]; then
    unset THEME
    export THEME=light
    it2prof light
    reload_profile
  fi
}

reload_profile() {
  if [ -f ~/.bash_profile ]; then
    . ~/.bash_profile
  fi
}

it2prof() {
  if [[ "$TERM" =~ "screen" ]]; then
    scrn_prof "$1"
  else
    # send escape sequence to change iTerm2 profile
    echo -e "\033]50;SetProfile=$1\007"
  fi
}

scrn_prof() {
  if [ -n "$TMUX" ]; then
    # tell tmux to send escape sequence to underlying terminal
    echo -e "\033Ptmux;\033\033]50;SetProfile=$1\007\033\\"
  else
    # tell gnu screen to send escape sequence to underlying terminal
    echo -e "\033P\033]50;SetProfile=$1\007\033\\"
  fi
}
alias vi="nvim"
alias v="vi"
alias o="open ."
alias pic="picgo upload|grep 'http' "  # 把剪切板的图片上传到图床返回http链接
alias em="/usr/local/Cellar/emacs/26.2/bin/emacs -nw"
alias idea="open -a /Applications/WebStorm.app"
alias ss=" ALL_PROXY=socks5://127.0.0.1:1080"
alias goproxy="export ALL_PROXY=socks5://127.0.0.1:1080"
alias disproxy='unset http_proxy https_proxy '
alias ip='curl ifconfig.me'
alias v2rayProxy="~/Library/Mobile\ Documents/com~apple~CloudDocs/shell/v2rayProxy.sh"
alias tmux="tmux -2"
alias win32="export WINEARCH=win32 export WINEPREFIX="$HOME/.wine32";"
alias win64="export WINEARCH=win64 export WINEPREFIX="$HOME/.wine";"
alias winjp="env LC_ALL=ja_JP.utf-8 wine"
# archey

