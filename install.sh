#!/bin/bash

#ENSURE UPDATED VUNDLE.VIM
git submodule update --init --recursive

#BACKUP OLD FILES
if [ -e ~/.vimrc ]; then
	mkdir -p ~/.vim_old
	echo "OLD .vimrc FOUND, MOVING TO .vim_old/.vimrc"
	mv ~/.vimrc ~/.vim_old/.vimrc
fi

if [ -d ~/.vim ]; then
	echo "OLD .vim FOUND, MOVING TO .vim_old/.vim"
	if [ -d ~/.vim_old/.vim ]; then
		echo "BACKUP WAS PRESENT IN .vim_old, REMOVING BACKUP..."
		rm -rf ~/.vim_old/.vim
	fi
	mv ~/.vim ~/.vim_old
fi

#COPY NEW SETTINGS
cp -r .vim ~/.vim
cp .vimrc ~/.vimrc

#INSTALL PACKAGES INTO VIM
vim "+VundleInstall" "+q" "+q"

