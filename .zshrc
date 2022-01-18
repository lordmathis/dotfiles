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

# Conda
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

# Node Version Manager

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

# Compinit
autoload -Uz compinit
compinit

# ZSH Plugins

## Oh My Zsh
source ~/.zsh/ohmyzsh/plugins/pip/pip.plugin.zsh
source ~/.zsh/ohmyzsh/plugins/command-not-found/command-not-found.plugin.zsh
source ~/.zsh/ohmyzsh/plugins/docker/_docker
source ~/.zsh/ohmyzsh/plugins/docker-compose/docker-compose.plugin.zsh
source ~/.zsh/ohmyzsh/plugins/git/git.plugin.zsh
source ~/.zsh/ohmyzsh/plugins/golang/golang.plugin.zsh
source ~/.zsh/ohmyzsh/plugins/jsontools/jsontools.plugin.zsh
source ~/.zsh/ohmyzsh/plugins/sudo/sudo.plugin.zsh

### Prompt Theme
source ~/.zsh/ohmyzsh/themes/gentoo.zsh-theme

## zsh-users
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-completions/zsh-completions.plugin.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh

# Set Prompt
setopt promptsubst

# Bindkeys
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
