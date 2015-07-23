#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

#if [[ -z $(pidof ssh-agent) && -z $(pidof gpg-agent) ]]; then
if keychain > /dev/null 2>&1; then
    eval $(keychain --eval --quiet --agents ssh,gpg id_rsa)
fi

################################################################################
# Completion
################################################################################

# Brew bash completion
if hash brew 2>/dev/null && -f `brew --prefix`/etc/bash_completion; then
    . `brew --prefix`/etc/bash_completion
fi

# Bash completion
if [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
fi

# Beets bash completion
if hash beet 2>/dev/null; then
    eval "$(beet completion)"
fi

# ssh/scp/sftp completion for known hosts
if [[ -e ~/.ssh/known_hosts ]]; then
    complete -o default -W "$(cat ~/.ssh/known_hosts | sed 's/[, ].*//' | sort | uniq )" ssh scp sftp
fi
