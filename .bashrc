#!/bin/bash

# Add bin location for 3rd party binaries
PATH=/opt/bin:$PATH
export PATH

#Make sure xterm is the default terminal
export TERMINAL=xterm
export EDITOR=vim
export BROWSER=firefox

#Custom prompt
if [ `id -un` = root ]; then
    PS1="\[\033[0;32m\]\u@\h:\[\033[1;30m\]\w\[\033[0;31m\]#\[\033[0m\] "
    #PS1="\[\033[0;31m\]\u@\h:\[\033[1;30m\]\w#\[\033[0m\] "
else
    PS1="\[\033[0;32m\]\u@\h:\[\033[1;30m\]\w\[\033[0;32m\]$\[\033[0m\] "
    #PS1="\[\033[0;32m\]\u@\h:\[\033[1;30m\]\w$\[\033[0m\] "
fi

#Fix less to work with colored output, like git diff
export LESS="-FiRMX"

# Enable ssh support in gpg-agent
#if [ -f "${HOME}/.gpg-agent-info" ]; then
#    . "${HOME}/.gpg-agent-info"
#    export GPG_AGENT_INFO
#    export SSH_AUTH_SOCK
#    export SSH_AGENT_PID
#fi
#
#GPG_TTY=$(tty)
#export GPG_TTY

#Make KDE apps look nice (since not booting to kde)
#export QT_PLUGIN_PATH=$HOME/.kde4/lib/kde4/plugins/:/usr/lib64/kde4/plugins/

# Change TTY colors to be nicer.
#if [ "$TERM" = "linux" ]; then
#    echo -en "\e]P0232323" #black
#    echo -en "\e]P82B2B2B" #darkgrey
#    echo -en "\e]P1D75F5F" #darkred
#    echo -en "\e]P9E33636" #red
#    echo -en "\e]P287AF5F" #darkgreen
#    echo -en "\e]PA98E34D" #green
#    echo -en "\e]P3D7AF87" #brown
#    echo -en "\e]PBFFD75F" #yellow
#    echo -en "\e]P48787AF" #darkblue
#    echo -en "\e]PC7373C9" #blue
#    echo -en "\e]P5BD53A5" #darkmagenta
#    echo -en "\e]PDD633B2" #magenta
#    echo -en "\e]P65FAFAF" #darkcyan
#    echo -en "\e]PE44C9C9" #cyan
#    echo -en "\e]P7E5E5E5" #lightgrey
#    echo -en "\e]PFFFFFFF" #white
#    clear #for background artifacting
#fi

# User defined aliases
alias cls='clear'
alias clls='clear; ls'
alias ll='ls -l'
alias lla='ls -la'
alias lsa='ls -A'
alias lsg='ls | grep'

alias grep='grep --color'

alias sshutdown='sudo /sbin/shutdown -h -P now'
alias ussuspend='sudo /usr/sbin/pm-suspend'
alias ssuspend='(xlock -mode blank &) && sudo /usr/sbin/pm-suspend'
alias akey='eval `keychain --clear --eval id_rsa`'
