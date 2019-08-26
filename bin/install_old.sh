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

if [ -e ~/.ctags ]; then
	echo "OLD .ctags FOUND, MOVING TO .vim_old/.ctags"
	mv ~/.ctags	~/.vim_old/.ctags
fi
			
#COPY NEW SETTINGS

## CREATE .vim folder and copy things in
mkdir -p ~/.vim
cp -r autoload ~/.vim
cp -r bundle ~/.vim
cp -r ftdetect ~/.vim
cp -r ftplugin ~/.vim
cp header ~/.vim
cp -r syntax ~/.vim
cp -r window ~/.vim

cp conf/.vimrc ~/.vimrc
cp conf/.ctags ~/.ctags

#INSTALL PACKAGES INTO VIM
vim "+VundleInstall" "+q" "+q"

#ENABLE gruvbox AS COLORSCHEME
sed -i 's/":colorscheme/:colorscheme/g' ~/.vimrc

