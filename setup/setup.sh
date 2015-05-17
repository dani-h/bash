#!/usr/bin/env bash

ROOT_DIR=`dirname $(dirname $0)`
RCFILES=$ROOT_DIR/rcfiles

bash "$ROOT_DIR/setup/git-setup.sh"
echo "Setting up symlinks"

if [ ! -L ~/.vimrc ]; then
    ln -s $ROOT_DIR/vimrc ~/.vimrc
fi

if [ ! -L ~/.nvimrc ]; then
    ln -s $ROOT_DIR/vimrc ~/.nvimrc
fi

if [ ! -L ~/.nvim ]; then
    ln -s ~/.vim ~/.nvim
fi

if [ ! -L ~/.inputrc ]; then 
    ln -s $RCFILES/inputrc ~/.inputrc
fi

if [ ! -L ~/.tmux.conf ]; then 
    ln -s $ROOT_DIR/conf/tmux.conf ~/.tmux.conf
fi

if [ ! -L ~/.sqliterc ]; then 
    ln -s $RCFILES/sqliterc ~/.sqliterc
fi

if [ ! -L ~/.jshintrc ]; then 
    ln -s $RCFILES/jshintrc ~/.jshintrc
fi

if [ ! -L ~/.eslintrc ]; then 
    ln -s $RCFILES/eslintrc ~/.eslintrc
fi

if [ ! -L ~/.jsbeautifyrc ]; then 
    ln -s $RCFILES/jsbeautifyrc ~/.jsbeautifyrc
fi

if [ ! -L ~/.tern-config ]; then 
    ln -s $ROOT_DIR/conf/tern-config ~/.tern-config
fi
