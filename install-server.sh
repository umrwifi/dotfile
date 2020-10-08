#!/bin/sh
cp -i -R ~/.config  ./config.lock
mv -i ./*  ~/.config
cd  ~/.config

link="
.tmux.conf
.bashrc
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

# install nvim
# yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
# yum install -y neovim python3-neovim
# install ctags
# 判断nvim 版本
# install tmux

