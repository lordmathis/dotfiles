# Dotfiles

My dotfiles configuration for zsh, nvim, and various development tools. Works across desktop and server environments.

## Requirements

* [git](https://git-scm.com/), [zsh](http://www.zsh.org/) and [bat](https://github.com/sharkdp/bat)

## Install

`curl https://raw.githubusercontent.com/lordmathis/dotfiles/main/install.sh | zsh -s -- common`

## Manual install

* `echo ".dotfiles" >> .gitignore`
* `git clone --bare git@github.com:lordmathis/dotfiles.git $HOME/.dotfiles`
* `function config { /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME "$@"; }`
* `config checkout common`
* `config submodule init`
* `config submodule update --recursive --remote`
* `source .zshrc`

## Usage

After installation, you can:
* Manage dotfiles: `config status`, `config add .vimrc`, `config commit -m "update"`
* Update everything: `config update` (pulls latest changes and updates all submodules)

**[Full Guide](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/)**