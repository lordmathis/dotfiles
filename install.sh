#!/usr/bin/zsh

if [ $# -eq 0 ]
  then
    echo "Git branch name missing"
    exit 1;
fi

echo ".dotfiles" >> $HOME/.gitignore
git clone --bare https://git.namesny.com/Mathis/dotfiles.git $HOME/.dotfiles &&
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME' &&
config checkout $1 &&
config submodule init &&
config submodule update &&
source .zshrc