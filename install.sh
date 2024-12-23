#!/usr/bin/zsh

if [ $# -eq 0 ]
  then
    echo "Git branch name missing"
    exit 1;
fi

BRANCH=$1


echo ".dotfiles" >> $HOME/.gitignore

git clone --bare https://github.com/LordMathis/dotfiles.git $HOME/.dotfiles

function config {
   /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME "$@"
}

cd $HOME

config checkout $BRANCH

config submodule init
config submodule update --recursive --remote