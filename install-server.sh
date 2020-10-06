#!/bin/sh
cp -i -R ~/.config  ./config.lock
mv -i ./*  ~/.config

link="
.tmux.conf
.bash_profile
.ctags
"
for i in $link ; do
   if [[ ! -f $HOME/$i ]]
   then
     echo $i "added "
     # 软链接必须使用完整路径
     ln -s  ~/.config/$i  ~/
   else 
     mv $HOME/$i  $HOME/$i.lock
     ln -s  ~/.config/$i  ~/
  fi
done

