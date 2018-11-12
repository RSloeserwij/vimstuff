#!/bin/bash

#ENSURE UPDATED VUNDLE.VIM
git submodules update --init --recursive

#BACKUP OLD FILES
if [ -e ~/.vimrc ]; then
	echo "OLD .vimrc FOUND, MOVING TO .vimrc_old"
	mv ~/.vimrc ~/.vimrc_old
fi

if [ -d ~/.vim ]; then
	echo "OLD .vim FOUND, MOVING TO .vim_old"
	mv ~/.vim ~/.vim_old
fi

#COPY NEW SETTINGS
cp -r .vim ~/.vim
cp .vimrc ~/.vimrc

#INSTALL PACKAGES INTO VIM
vim "+VundleInstall" "+q" "+q"

