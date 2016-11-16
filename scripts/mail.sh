#!/bin/sh
maildirs="
    $HOME/.mail/jarcher@infoxchange.org/INBOX/new/
    $HOME/.mail/jess@jessarcher.com/INBOX/new/
"
unread=$(find $maildirs -type f 2>/dev/null | wc -l)
if [ $unread -gt 0 ]; then
    echo " $unread"
    echo " $unread"
    echo \#87d7ff
fi;
