#!/bin/bash

if [ -e $HOME/.dotfiles ]; then
    DOTFILES=$HOME/.dotfiles
else
    DOTFILES=$HOME/dotfiles
fi

echo -e "\nCreating symlinks"
echo "=============================="
linkables=$( find -H "$DOTFILES" -maxdepth 3 -name '*.symlink'  )
for file in $linkables ; do
    target="$HOME/.$( basename $file ".symlink"  )"
    if [ -e $target  ]; then
        echo "~${target#$HOME} already exists... Skipping."
    else
        echo "Creating symlink for $file"
        ln -s $file $target
    fi
done

# Could add something to install base16 them in .config
