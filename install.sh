#!/bin/sh
SCRIPTPATH=`pwd -P`

mkdir -p ~/.config/nvim/
ln -s "${SCRIPTPATH}/vimrc" ~/.config/nvim/init.vim
ln -s "${SCRIPTPATH}/vimrc" ~/.vimrc

ln -s "${SCRIPTPATH}/gitconfig" ~/.gitconfig

ln -s "${SCRIPTPATH}/tmux.conf" ~/.tmux.conf


# Install vim-plug (package manager) for vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +PlugInstall 

