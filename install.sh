#!/bin/bash

#BACKUP OLD FILES
if [ -e ~/.vimrc ]; then
	mv ~/.vimrc ~/.vimrc_old
fi

if [ -d ~/.vim ]; then
	mv ~/.vim ~/.vim_old
fi

#COPY NEW SETTINGS
cp -r .vim ~/.vim
cp .vimrc ~/.vimrc

#INSTALL PACKAGES INTO VIM
vim "+VundleInstall" "+q" "+q"

