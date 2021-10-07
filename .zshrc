#source $HOME/.antigen.zsh
source $HOME/.aliases

# Set $PATH
export PATH=$HOME/bin:$PATH

# Set Golang
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/Projects/golang
export PATH=$PATH:$GOPATH/bin

# History
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=15000 # keep 15,000 lines in memory
export SAVEHIST=10000 # but save only 10,000 of them

# VTE
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
    source /etc/profile.d/vte.sh
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/matus/bin/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/matus/bin/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/matus/bin/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/matus/bin/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
#
# >>> Lazy NVM >>>

lazynvm() {
  unset -f nvm node npm
  export NVM_DIR=~/.nvm
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
}

nvm() {
  lazynvm 
  nvm $@
}

node() {
  lazynvm
  node $@
}

npm() {
  lazynvm
  npm $@
}

# <<< Lazy NVM <<<

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

# Zinit plugins and themes

# Must Load OMZ Git library
zinit snippet OMZL::git.zsh

# Load Git plugin from OMZ
zinit snippet OMZP::git
zinit cdclear -q # <- forget completions provided up to this moment

zinit light zinit-zsh/z-a-meta-plugins
zinit light zsh-users/zsh-history-substring-search

zinit snippet OMZ::plugins/pip/pip.plugin.zsh
zinit snippet OMZ::plugins/docker-compose/docker-compose.plugin.zsh
zinit snippet OMZ::plugins/docker/_docker
zinit snippet OMZ::plugins/command-not-found/command-not-found.plugin.zsh

zinit for annexes zsh-users+fast zdharma

setopt prompt_subst

zinit wait'!' lucid for \
    OMZL::prompt_info_functions.zsh \
    OMZT::gentoo

bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
