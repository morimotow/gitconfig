#!/bin/bash

cd `dirname $0`
SCR_DIR=`pwd`

# 環境を特定
if [ "$(uname)" == 'Darwin' ]; then
    OSENV='Mac'
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
    if [ $(echo `uname -r` | grep -i 'Microsoft') ]; then
        OSENV='WSL'
    else
        OSENV='Linux'
    fi
elif [ "$(expr substr $(uname -s) 1 10)" == 'MINGW32_NT' ]; then
    OSENV='Cygwin'
else
    echo "Your platform ($(uname -a)) is not supported."
    exit 1
fi

# 環境に合わせたファイル切り替え
if [ ${OSENV} = "WSL" ]; then
    CONFIG_FILE=.gitconfig.wsl
else
    CONFIG_FILE=.gitconfig.linux
fi

# ファイルのシンボリックリンクを作成
ln -sf $SCR_DIR/$CONFIG_FILE ~/.gitconfig
