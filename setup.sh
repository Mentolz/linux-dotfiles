#!/usr/bin/env bash

DOTDIR=$HOME/.dotfiles


echo "setup vim"
ln -s $DOTDIR/.vimrc $HOME/.vimrc

echo "setup other stuff"
ln -s $DOTDIR/gitconfig $HOME/.gitconfig
ln -s $DOTDIR/tmux.config $HOME/.tmux.config
ln -s $DOTDIR/.bashrc $HOME/.bashrc

echo "setup zsh"
ln -s $DOTDIR/zshrc $HOME/.zshrc
ln -s $DOTDIR/oh-my-zsh $HOME/.oh-my-zsh

zshrc="$HOME/.zshrc"
if [ -e "$zshrc"  ]
then
    mv $zshrc "$zshrc.1"
fi
ln -s $DOTDIR/zshrc $zshrc

read -p "Add this /usr/local/bin/zsh >> /etc/shells " yn
#change shell to zsh
chsh -s $(which zsh)

echo "pip install global"
pip install -r $DOTDIR/pip.txt
pip3 install -r $DOTDIR/pip.txt

echo "Done"
