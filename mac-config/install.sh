#!/bin/bash

CF_DIR=`pwd`
HOME_DIR=~

echo '安装zshrc...'
rm -rf $HOME_DIR/.zshrc
ln -s $CF_DIR/zshrc $HOME_DIR/.zshrc
echo 'zshrc安装成功'
