#!/bin/sh

#cp -i -R ~/.config  ./config.lock
#mv -i ./*  ~/.config

link="
.tmux.conf
.bashrc
.zshrc
.ctags
.spacemacs
.npmrc
.gitconfig
"
for i in $link ; do
   if [[ ! -f $HOME/$i ]]
   then
     echo $i "added "
     # 软链接必须使用完整路径
     ln  ~/.config/$i  ~/
   else 
     mv $HOME/$i  $HOME/$i.lock
     ln  ~/.config/$i  ~/
  fi
done

# iina 设置
ln /Users/admin/.config/mpv/my.conf  /Users/admin/Library/Application\ Support/com.colliderli.iina/input_conf/
