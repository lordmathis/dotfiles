# Dotfiles

My dotfiles. If you want to use them fork or clone the repo.

## Requirements

* [git](https://git-scm.com/), [zsh](http://www.zsh.org/), [antigen](https://github.com/zsh-users/antigen) and [bat](https://github.com/sharkdp/bat)
* Desktop environment: 
  * [i3](https://i3wm.org/)
  * [polybar](https://github.com/jaagr/polybar)
  * [rofi](https://github.com/DaveDavenport/rofi)
* For conky you also need [conky](https://github.com/brndnmtthws/conky), [bash-fuzzy-clock](https://github.com/coreymwamba/bashfuzzyclock), [Poiret One font](https://www.fontsquirrel.com/fonts/poiret-one) and [compton](https://github.com/yshui/compton)
* Polybar scripts are adapted from [here](https://github.com/x70b1/polybar-scripts) 

## Usage

* `echo ".dotfiles" >> .gitignore`
* `git clone --bare https://github.com/LordMathis/dotfiles/ $HOME/.dotfiles`
* `alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'`
* `config checkout`
* `source .zshrc`
* run `bin/setup.sh`

## [Full Guide](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/)
