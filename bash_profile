#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

#if [[ -z $(pidof ssh-agent) && -z $(pidof gpg-agent) ]]; then
if keychain > /dev/null 2>&1; then
	eval $(keychain --eval --quiet --agents ssh,gpg id_rsa)
fi
