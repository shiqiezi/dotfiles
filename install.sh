#!/bin/bash

files="tmux.conf gitconfig"

echo "You're going to install all the files including: "
echo "{ $files }"
echo -n "Are you sure to go on? [y/N] "
read goon
if [ "$goon" = "y" -o "$goon" = "Y" ]; then
    for file in $files; do
        [ -f ~/.$file -o -d ~/.$file ] && mv ~/.$file ~/.$file.old
        echo "Creating symlink to $file in home directory."
		ln -sf $(pwd)/$file ~/.$file
    done
fi

# Install spf13-vim3
curl http://j.mp/spf13-vim3 -L -o - | sh

echo "Fin. Enjoy it!"
