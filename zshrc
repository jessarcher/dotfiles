#
#                           ⢸⣦⡈⠻⣿⣿⣿⣿⣿⣿⣷⣦⡀
#                           ⢸⣿⣿⣦⡈⠻⣿⣿⣿⣿⣿⣿⣿⣦⡀
#                           ⢸⣿⣿⣿⣿⣦⡈⠻⣿⣿⣿⣿⣿⣿⣿⣦⡀
#                           ⢸⣿⣿⣿⣿⣿⣿⣦⠈⠻⣿⣿⣿⣿⣿⣿⣿⣦⡀
#                        ⢀⣀⣴⣿⣿⣿⣿⣿⣿⣿⡿  ⠈⠻⣿⣿⣿⣿⣿⣿⣿⣦⡀
#                ⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠁    ⠈⠻⣿⣿⣿⣿⣿⣿⣿⣦⡀
#                  ⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠛⠉         ⠈⠛⠿⣿⣿⣿⣿⣿⣿⣦⡀
#
#   Personal zsh configuration of Jess Archer <jess@jessarcher.com>

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(
    artisan
    npm
    #adb
    #bower
    #composer
    #cp
    #dnf
    #docker
    #docker-compose
    #git
    #git-flow
    #gpg-agent
    #gulp
    #httpie
    #jsontools
    #jump
    #nmap
    #rsync
    #ssh-agent
    #tmux
    #tmuxinator
    #z
)
source $ZSH/oh-my-zsh.sh

#--------------------------------------------------------------------------
# Configuration
#--------------------------------------------------------------------------

HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"

typeset -U path cdpath fpath

# Vim mode
bindkey -v
export KEYTIMEOUT=1

export ANDROID_HOME="$HOME/Android/Sdk/"

export GIT_EDITOR=vim

path=(
    $HOME/.local/bin
    $HOME/.config/composer/vendor/bin
    $HOME/.go/bin
    ./vendor/bin
    ${ANDROID_HOME}tools/
    ${ANDROID_HOME}platform-tools/
    $path
)

setopt auto_cd
cdpath=(
    $HOME/Code
)

zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format %d
zstyle ':completion:*:descriptions' format %B%d%b
zstyle ':completion:*:complete:(cd|pushd):*' tag-order \
    'local-directories named-directories'

export EDITOR='vim'
export NVIM_LISTEN_ADDRESS='/tmp/nvimsocket'
export ARTISAN_OPEN_ON_MAKE_EDITOR='nvr'
export FZF_DEFAULT_COMMAND='ag -u -g ""'

unsetopt sharehistory

#--------------------------------------------------------------------------
# Aliases
#--------------------------------------------------------------------------

alias vim="nvim"
alias copy="xclip -selection clipboard"
alias paste="xclip -o -selection clipboard"
alias cat="bat"
alias webcam="gphoto2 --stdout --capture-movie | ffmpeg -i - -vcodec rawvideo -pix_fmt yuv420p -threads 0 -f v4l2 /dev/video2"

# Laravel
alias a="artisan"
alias tinker="artisan tinker"
alias serve="artisan serve"
alias mfs="artisan migrate:fresh --seed"

# Git
alias g="git"
alias gs="git s"
alias nah="git reset --hard;git clean -df"
alias co="git checkout"
alias main='git checkout $([ `git rev-parse --quiet --verify master` ] && echo "master" || echo "main")'

# Docker
alias d="docker"
alias dc="docker compose"

open () {
    xdg-open $* > /dev/null 2>&1
}

composer-link() {
    composer config repositories.local '{"type": "path", "url": "'$1'"}' --file composer.json
}

#--------------------------------------------------------------------------
# Miscellaneous
#--------------------------------------------------------------------------

if [[ $- == *i* && $0 == '/usr/bin/zsh' ]]; then
    ~/.dotfiles/scripts/login.sh
fi

### Fix slowness of pastes with zsh-syntax-highlighting.zsh
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish
### Fix slowness of pastes

if [ -e /home/jess/.nix-profile/etc/profile.d/nix.sh ]; then . /home/jess/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
