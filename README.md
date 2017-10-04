# Dotfiles

My dotfiles. If you want to use them fork or clone the repo.

## Usage

* Requirements [git](https://git-scm.com/), [zsh](http://www.zsh.org/), [antigen](https://github.com/zsh-users/antigen) and [ccat](https://github.com/jingweno/ccat)
* For conky you also need [conky](https://github.com/brndnmtthws/conky), [bash-fuzzy-clock](https://github.com/coreymwamba/bashfuzzyclock) and [Poiret One font](https://www.fontsquirrel.com/fonts/poiret-one)
* `echo ".dotfiles" >> .gitignore`
* `git clone --bare https://github.com/LordMathis/dotfiles/ $HOME/.dotfiles`
* `alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'`
* `config checkout`
* `source .zshrc`

## [Full Guide](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/)
