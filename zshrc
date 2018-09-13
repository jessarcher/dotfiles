export ZSH=~/.oh-my-zsh

ZSH_THEME="robbyrussell"

HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"
DISABLE_AUTO_TITLE="true"

plugins=(git git-flow laravel5 gulp composer docker docker-compose rsync pass npm bower gpg-agent ssh-agent tmux tmuxinator sack)

export PATH="$HOME/.local/bin:$HOME/.bin:$HOME/.composer/vendor/bin:$HOME/.go/bin:./vendor/bin:./node_modules/.bin:$PATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

unsetopt sharehistory

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias dc="docker-compose"
alias dce="docker-compose exec"
alias dcea="docker-compose exec app"
dceas () {
    docker-compose exec app su app -c "$*"
}
alias dceasa="dceas php artisan"
alias mux="tmuxinator"
open () {
    xdg-open $* > /dev/null 2>&1
}
alias v="nvim"
alias vim="nvim"
alias copy="xclip -selection clipboard"
alias paste="xclip -o -selection clipboard"
alias ag="sag"

if (( $+commands[tag] )); then
    tag() { command tag "$@"; source ${TAG_ALIAS_FILE:-/tmp/tag_aliases} 2>/dev/null }
    alias ag=tag
fi

# BASE16_SHELL=$HOME/.config/base16-shell/
# [ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
# base16_ocean

~/.dotfiles/scripts/login.sh
