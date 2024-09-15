# Dotfiles

My dotfiles. If you want to use them fork or clone the repo. Each branch has specific dotfiles for one of my machines

## Requirements

* [git](https://git-scm.com/), [zsh](http://www.zsh.org/) and [bat](https://github.com/sharkdp/bat)

## Install

`curl https://raw.githubusercontent.com/LordMathis/dotfiles/main/install.zsh | zsh -s -- <branch name>`

## Manual install

* `echo ".dotfiles" >> .gitignore`
* `git clone --bare git@github.com:LordMathis/dotfiles.git $HOME/.dotfiles`
* `alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'`
* `config checkout <branch-name>`
* `config submodule init`
* `config submodule update`
* `source .zshrc`

## [Full Guide](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/)
