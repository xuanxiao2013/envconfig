#!/bin/bash

BASEDIR=$(dirname $0)
cd $BASEDIR
CURRENT_DIR=`pwd`

lnif() {
    if [ -e "$1" ]; then
    	rm -rf "$2"
        ln -sf "$1" "$2"
    fi
}

echo '建立.vimrc连接'
VIMRC_DIR=$CURRENT_DIR/vimrc
rm -rf $HOME/.vimrc
lnif $CURRENT_DIR/_vimrc $HOME/.vimrc

echo '建立.vim连接'
rm -rf $HOME/.vim
lnif $CURRENT_DIR/ $HOME/.vim


echo '安装插件...'
rm -rf $HOME/.vimrc.bundles
lnif $CURRENT_DIR/_bundles $HOME/.vimrc.bundles
# 在线安装太慢，直接copy下载好的

echo '安装vim中文文档...'
cd $HOME/.vim/libs/vimcdoc-1.9.0/
./vimcdoc.sh -i
echo 'vim中文文档安装完成'

echo "安装完成!"
