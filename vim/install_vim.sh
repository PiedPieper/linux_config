#!/usr/bin/env bash

set -e

## Git load submodules 
echo "Loading Submodules"       

## Clear .vim to rebuild fresh
rm -rf .vim
mkdir .vim


## Install plugin managers 
if [ ! -d .vim/autoload ]
then
    echo "Installing Pathogen"       
    cp -r plugin_managers/vim-pathogen/autoload .vim/autoload
fi


## Install plugins 
install_dir=.vim/bundle
mkdir $install_dir
while IFS=, read -r plugin 
do
   echo "installing plugin to $install_dir"
   cp -r plugins/$plugin $install_dir 
done < active_plugins.txt


if [ ! -d $HOME/.vim ]; then
    ln -s $(pwd)/.vim $HOME/.vim
fi
if [ ! -f $HOME/.vimrc ]; then
    ln -s $(pwd)/.vimrc $HOME/.vimrc
fi
