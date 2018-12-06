#
#                                    ________
#                                  |\\W#####M\
#                                  |M\\W#####M\
#                                  |#M\\W#####M\
#                                  |##M\\W#####M\
#                                  A###M\\W#####M\
#                         _______,a#####M|\W#####M\
#                         \W############W  \W#####M\
#                          \W##########W    \W#####M\
#                           'YW#####W7'      \W#####M\
#                              ¯¯¯¯¯          ¯¯¯¯¯¯¯¯
#
#           Personal .zshrc file of Jess Archer <jess@jessarcher.com>
#

# Plugins {{{
# ==============================================================================

    # Load the Antigen plugin manager for zsh.
    source ~/.dotfiles/antigen/antigen.zsh

    # Load the oh-my-zsh library.
    antigen use oh-my-zsh

    # Bundles from the default repo (robbyrussell's oh-my-zsh).
    antigen bundle adb
    antigen bundle bower
    antigen bundle composer
    antigen bundle cp
    antigen bundle dnf
    antigen bundle docker
    antigen bundle docker-compose
    antigen bundle git
    antigen bundle git-flow
    antigen bundle gpg-agent
    antigen bundle gulp
    antigen bundle httpie
    antigen bundle jsontools
    antigen bundle jump
    antigen bundle nmap
    antigen bundle npm
    antigen bundle pass
    antigen bundle rsync
    antigen bundle sack
    antigen bundle ssh-agent
    antigen bundle tmux
    antigen bundle tmuxinator

    # Other bundles
    antigen bundle jessarcher/zsh-artisan
    antigen bundle zsh-users/zsh-autosuggestions

    # This needs to be the last bundle.
    antigen bundle zsh-users/zsh-syntax-highlighting

    # Load the theme.
    antigen theme robbyrussell

    # Tell Antigen that you're done.
    antigen apply

# }}}

#  Configuration {{{
# ==============================================================================

    HYPHEN_INSENSITIVE="true"
    ENABLE_CORRECTION="false"
    COMPLETION_WAITING_DOTS="true"
    HIST_STAMPS="yyyy-mm-dd"
    DISABLE_AUTO_TITLE="true"

    path=(
        $HOME/.local/bin
        $HOME/.bin
        $HOME/bin
        $HOME/.composer/vendor/bin
        $HOME/.go/bin
        ./vendor/bin
        $path
    )

    export EDITOR='vim'

    unsetopt sharehistory

# }}}

# Aliases & Functions {{{
# ==============================================================================

    # Laravel
    alias a="artisan"
    alias tinker="artisan tinker"
    alias serve="artisan serve"
    homestead() {
        ( cd ~/Homestead && vagrant $* )
    }

    # Git
    alias g="git"
    alias gs="git s"
    alias nah="git reset --hard;git clean -df"

    # Docker
    alias d="docker"
    alias dc="docker-compose"
    alias dce="docker-compose exec"
    alias dcea="docker-compose exec app"
    dceas () {
        docker-compose exec app su app -c "$*"
    }
    alias dceasa="dceas php artisan"

    # General
    alias v="nvim"
    alias vim="nvim"
    alias mux="tmuxinator"
    alias copy="xclip -selection clipboard"
    alias paste="xclip -o -selection clipboard"
    alias ag="sag"
    alias cat="bat"
    cdls() {
        cd $1 && eval ls
    }
    alias cd="cdls"
    open () {
        xdg-open $* > /dev/null 2>&1
    }

    if (( $+commands[tag] )); then
        tag() { command tag "$@"; source ${TAG_ALIAS_FILE:-/tmp/tag_aliases} 2>/dev/null }
        alias ag=tag
    fi

# }}}

# Interactive shell startup scripts {{{
# ==============================================================================

    if [[ $- == *i* ]]; then
        ~/.dotfiles/scripts/login.sh
    fi

# }}}

# vim: set nospell foldmethod=marker foldlevel=0:
