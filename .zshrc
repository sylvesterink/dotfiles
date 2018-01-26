# The following lines were added by compinstall

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _ignored _match _approximate
zstyle ':completion:*' completions 1
zstyle ':completion:*' format '---- %d'
zstyle ':completion:*' glob 1
zstyle ':completion:*' group-name ''
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' match-original both
zstyle ':completion:*' matcher-list '' '+m:{[:lower:]}={[:upper:]} m:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' max-errors 2 numeric
zstyle ':completion:*' menu select=2
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' prompt 'Possible matches for: %e'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' substitute 1
zstyle :compinstall filename '/home/sylvester/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=2000
SAVEHIST=2000
setopt appendhistory extendedglob nomatch notify
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install

# FOR VI MODE Make keys work right
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

# Show when in vi-command mode
precmd() {
  RPROMPT=""
}
zle-keymap-select() {
  RPROMPT=""
  [[ $KEYMAP = vicmd ]] && RPROMPT="%{$fg_bold[yellow]%}[% CMD]% %{$reset_color%}"
  () { return $__prompt_status }
  zle reset-prompt
}
zle-line-init() {
  typeset -g __prompt_status="$?"
}
zle -N zle-keymap-select
zle -N zle-line-init

#decrease command mode lag
export KEYTIMEOUT=1
# END VI MODE

autoload -U colors && colors
PROMPT="%{$fg_bold[green]%}%n@%m:%{$fg_bold[blue]%}%~%(!.%{$fg_bold[red]%}#%{$reset_color%}.%{$fg_bold[green]%}$%{$reset_color%}) "
#autoload -U promptinit
#promptinit

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
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

# some more ls aliases
alias cls='clear'
alias clls='clear; ls'

alias lsa='ls -A'
alias lla='ls -la'
alias ll='ls -alF'
alias l='ls -CF'
alias lsg='ls | grep'

alias grep='grep --color'

alias sshutdown='sudo /sbin/shutdown -h -P now'
alias sreboot='sudo /sbin/shutdown -r now'
alias ussuspend='sudo /usr/sbin/pm-suspend'
alias ssuspend='(xlock -mode blank &) && sudo /usr/sbin/pm-suspend'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

#Make sure urxvt is the default terminal
export TERMINAL=urxvt
export EDITOR=vim

function set_title ()
{
  unset PROMPT_COMMAND
  case "$TERM" in
    xterm*|rxvt*)
      if [ $# -lt 1 ]; then
        export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
      else
        if [ $# -eq 1 ]; then
          export PROMPT_COMMAND='\
            echo -ne "\033]0;'$1'\007";\
            echo -ne "\033]1;'$1'\007"'
        fi
        if [ $# -eq 2 ]; then
          export PROMPT_COMMAND='\
            echo -ne "\033]0;'$1'\007";\
            echo -ne "\033]1;'$2'\007"'
        fi
      fi
      ;;
    *)
      ;;
  esac
}

alias st='set_title'
alias gitlog='git log --pretty="%h:  %s"'
