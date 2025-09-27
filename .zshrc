source $HOME/.aliases

# Set $PATH
export PATH=$HOME/bin:$PATH

# History
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=15000 # keep 15,000 lines in memory
export SAVEHIST=10000 # but save only 10,000 of them
export HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=true

# ohmyzsh cache dir
export ZSH_CACHE_DIR=$HOME/.zsh/cache
mkdir -p "$ZSH_CACHE_DIR/completions"

# Editor
export EDITOR=nvim
export GIT_EDITOR=nvim

open () {
    xdg-open "$@" &>/dev/null
}


# Enhanced dotfiles config function
config() {
    # Helper function to avoid repetition
    local _config_git() {
        /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME "$@"
    }

    # Special case for 'update' command
    if [[ "$1" == "update" ]]; then
        echo "Updating dotfiles repository..."

        # Navigate to home directory
        local current_dir=$(pwd)
        cd $HOME

        # Fetch latest changes from remote
        _config_git fetch origin

        # Get current branch name
        local current_branch=$(_config_git branch --show-current)

        if [ -z "$current_branch" ]; then
            echo "Error: Could not determine current branch"
            cd $current_dir
            return 1
        fi

        echo "Current branch: $current_branch"

        # Pull latest changes for current branch
        echo "Pulling latest changes..."
        _config_git pull origin $current_branch

        # Update all submodules to their latest commits
        echo "Updating submodules..."
        _config_git submodule update --recursive --remote

        # Show status
        echo "Update complete! Current status:"
        _config_git status --short

        echo "Submodule status:"
        _config_git submodule status

        # Return to original directory
        cd $current_dir
    else
        # Pass through to regular git command
        _config_git "$@"
    fi
}

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
source ~/.zsh/ohmyzsh/plugins/docker/docker.plugin.zsh
source ~/.zsh/ohmyzsh/plugins/docker-compose/docker-compose.plugin.zsh
source ~/.zsh/ohmyzsh/plugins/git/git.plugin.zsh
source ~/.zsh/ohmyzsh/plugins/golang/golang.plugin.zsh
source ~/.zsh/ohmyzsh/plugins/helm/helm.plugin.zsh
source ~/.zsh/ohmyzsh/plugins/jsontools/jsontools.plugin.zsh
source ~/.zsh/ohmyzsh/plugins/kubectl/kubectl.plugin.zsh
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
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
