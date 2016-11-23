#!/bin/bash

RELEASE_DIR=`dirname $0`
cd $RELEASE_DIR

CF_DIR=`pwd`
HOME_DIR=~

lnif() {
    if [ -e "$1" ]; then
    	rm -rf "$2"
        ln -sf "$1" "$2"
    fi
}

echo '安装zshrc...'
rm -rf $HOME_DIR/.zshrc
ln -s $CF_DIR/zshrc $HOME_DIR/.zshrc

echo '配置git...'
rm -rf $HOME_DIR/.gitconfig
ln -s $CF_DIR/gitconfig $HOME_DIR/.gitconfig


rm -rf $HOME/.osconfig
lnif $CF_DIR/ $HOME/.osconfig

echo 'zshrc安装成功'
