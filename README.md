# Dotfiles

My dotfiles. If you want to use them fork or clone the repo. Each branch has specific dotfiles for one of my machines

## Requirements

* [git](https://git-scm.com/), [zsh](http://www.zsh.org/), [antigen](https://github.com/zsh-users/antigen) and [bat](https://github.com/sharkdp/bat)
* For conky you also need [conky](https://github.com/brndnmtthws/conky), [bash-fuzzy-clock](https://github.com/coreymwamba/bashfuzzyclock), [Poiret One font](https://www.fontsquirrel.com/fonts/poiret-one) and [compton](https://github.com/yshui/compton)

## Usage

* `echo ".dotfiles" >> .gitignore`
* `git clone --bare https://git.damogran.space/Mathis/dotfiles.git $HOME/.dotfiles`
* `alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'`
* `config checkout`
* `source .zshrc`

## [Full Guide](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/)
