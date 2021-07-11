source $HOME/.antigen.zsh
source $HOME/.aliases

# Set $PATH
export PATH=$HOME/bin:$PATH

# Set Golang
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/Projects/golang
export PATH=$PATH:$GOPATH/bin

# Set Kubeconfig
export KUBECONFIG=$KUBECONFIG:$HOME/Projects/rddl1-kubeconfig.yaml

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found
antigen bundle kubectl

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

# Load the theme.
antigen theme gentoo

# Tell Antigen that you're done.
antigen apply

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
