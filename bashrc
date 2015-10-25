#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

###########
# General #
###########

# Auto "cd" when entering just a path
shopt -s autocd 2> /dev/null

# Line wrap on window resize
shopt -s checkwinsize 2> /dev/null

# Case-insensitive tab completetion
bind 'set completion-ignore-case on'

# When displaying tab completion options, show just the remaining characters
bind 'set completion-prefix-display-length 2'

# Show tab completion options on the first press of TAB
bind 'set show-all-if-ambiguous on'
bind 'set show-all-if-unmodified on'


########
# Path #
########

PATH=/usr/local/bin:$PATH
PATH=~/.composer/vendor/bin:$PATH
PATH=./vendor/bin:$PATH
PATH=~/bin:$PATH

###########
# History #
###########

# Append to the Bash history file, rather than overwriting
shopt -s histappend 2> /dev/null

# Hide some commands from the history
#export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help";

# Entries beginning with space aren't added into history, and duplicate
# entries will be erased (leaving the most recent entry).
export HISTCONTROL="ignorespace:erasedups"

# Give history timestamps.
export HISTTIMEFORMAT="[%F %T] "

# Lots o' history.
export HISTSIZE=10000
export HISTFILESIZE=10000


###########
# Exports #
###########

export EDITOR="vim"

###########
# Aliases #
###########

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
	colorflag="--color"
else # OS X `ls`
	colorflag="-G"
fi

alias ls='ls -lhF ${colorflag}'
alias lsa='ls -A'
alias lsd="ls ${colorflag} | /usr/bin/grep --color=never '^d'"
alias lsda="lsa | /usr/bin/grep --color=never '^d'"

alias grep='grep --color=auto -n -i'

alias clear="clear && printf '\e[3J'";

alias df="df -h"
alias du="du -h"

if [ -f /usr/bin/xdg-open ]; then
    alias open='/usr/bin/xdg-open'
fi

# Pacman aliases
alias pacupg='sudo pacman -Syu'		# Synchronize with repositories and then upgrade packages that are out of date on the local system.
alias pacin='sudo pacman -S'		# Install specific package(s) from the repositories
alias pacins='sudo pacman -U'		# Install specific package not from the repositories but from a file
alias pacre='sudo pacman -R'		# Remove the specified package(s), retaining its configuration(s) and required dependencies
alias pacrem='sudo pacman -Rns'		# Remove the specified package(s), its configuration(s) and unneeded dependencies
alias pacrep='pacman -Si'		# Display information about a given package in the repositories
alias pacreps='pacman -Ss'		# Search for package(s) in the repositories
alias pacloc='pacman -Qi'		# Display information about a given package in the local database
alias paclocs='pacman -Qs'		# Search for package(s) in the local database
alias paclo="pacman -Qdt"		# List all packages which are orphaned
alias pacc="sudo pacman -Scc"		# Clean cache - delete all not currently installed package files
alias paclf="pacman -Ql"		# List all files installed by a given package
alias pacexpl="pacman -D --asexp"	# Mark one or more installed packages as explicitly installed
alias pacimpl="pacman -D --asdep"	# Mark one or more installed packages as non explicitly installed

# '[r]emove [o]rphans' - recursively remove ALL orphaned packages
alias pacro="pacman -Qtdq > /dev/null && sudo pacman -Rns \$(pacman -Qtdq | sed -e ':a;N;$!ba;s/\n/ /g')"

# Additional pacman alias examples
#alias pacupd='sudo pacman -Sy && sudo abs'         # Update and refresh the local package and ABS databases against repositories
alias pacupd='sudo pacman -Sy'         # Update and refresh the local package and ABS databases against repositories
alias pacinsd='sudo pacman -S --asdeps'            # Install given package(s) as dependencies
alias pacmir='sudo pacman -Syy'                    # Force refresh of all package lists after updating /etc/pacman.d/mirrorlist

# dealing with the following message from pacman:
#
#     error: couldnt lock database: file exists
#     if you are sure a package manager is not already running, you can remove /var/lib/pacman/db.lck

alias pacunlock="sudo rm /var/lib/pacman/db.lck"   # Delete the lock file /var/lib/pacman/db.lck
alias paclock="sudo touch /var/lib/pacman/db.lck"  # Create the lock file /var/lib/pacman/db.lck




##########
# Colors #
##########

if dircolors > /dev/null 2>&1; then
	eval $(dircolors -b ~/.dircolors)
fi

reset=$(tput sgr0)
black=$(tput setaf 0)
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 2)
blue=$(tput setaf 4)
magenta=$(tput setaf 5)
cyan=$(tput setaf 6)
white=$(tput setaf 7)
brightblack=$(tput setaf 8)
brightred=$(tput setaf 9)
brightgreen=$(tput setaf 10)
brightyellow=$(tput setaf 11)
brightblue=$(tput setaf 12)
brightmagenta=$(tput setaf 13)
brightcyan=$(tput setaf 14)
brightwhite=$(tput setaf 15)


##########
# Prompt #
##########

if [[ "$USER" == "root" ]]; then
	prompt_col_1=$brightred
	prompt_col_2=$red
elif [[ "$SSH_TTY" ]]; then
	prompt_col_1=$brightgreen
	prompt_col_2=$green
else
	prompt_col_1=$brightblue
	prompt_col_2=$blue
fi

PS1='\n\[$reset\]\[$prompt_col_1\]\u\[$reset\]@\[$prompt_col_2\]\h\[$prompt_col_1\]:\W'

if [ -f ~/.git-prompt.sh ]; then
	source ~/.git-prompt.sh
	export PS1+='\[$prompt_col_2\]$(__git_ps1 "(%s)")'
fi

PS1+='\[$reset\]\n\$ '


#############
# Functions #
#############

# Search in files
sif() {
grep -EiIrl "$*" .
}

# Colored man pages
man() {
env LESS_TERMCAP_mb=$'\E[01;31m' \
LESS_TERMCAP_md=$'\E[01;38;5;74m' \
LESS_TERMCAP_me=$'\E[0m' \
LESS_TERMCAP_se=$'\E[0m' \
LESS_TERMCAP_so=$'\E[38;5;246m' \
LESS_TERMCAP_ue=$'\E[0m' \
LESS_TERMCAP_us=$'\E[04;38;5;146m' \
man "$@"
}

cl() {
local dir="$1"
local dir="${dir:=$HOME}"
if [[ -d "$dir" ]]; then
    cd "$dir" >/dev/null; ls
else
    echo "bash: cl: $dir: Directory not found"
fi
}


# Command Not Found
[ -r /etc/profile.d/cnf.sh ] && . /etc/profile.d/cnf.sh

if [ -f ~/.bashrc_local ]; then
    source ~/.bashrc_local
fi
