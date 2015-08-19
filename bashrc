# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
# case "$TERM" in
# xterm-color)
#     PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#     ;;
# *)
#     PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#     ;;
# esac

# Comment in the above and uncomment this below for a color prompt
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;35m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

# add support for 256 colors
# requires ncurses-term to be installed
export TERM=xterm-256color
# export TERM=linux

export GREP_OPTIONS='--colour=always --exclude=tags'
export GREP_COLORS='ms=01;31:mc=01;31:sl=:cx=:fn=33:ln=32:bn=32:se=36';
# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable color support of ls and also add handy aliases

    
if [ "$TERM" != "dumb" ] && [ -x /usr/bin/dircolors ]; 
#then eval "`dircolors -b`" 
then 
    #alias ls='ls --color=auto' 
    #alias dir='ls --color=auto --format=vertical'
    #alias vdir='ls --color=auto --format=long'
    d=.dircolors
    test -r $d && eval "$(dircolors $d)"


fi

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF' 
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# CVS repository information
CVSROOT=~/cvsroot
CVSIGNORE=~/.cvsignore
export CVSROOT
export CVSIGNORE


# add a path for user
export PATH=$PATH:/usr/local/sbin:/usr/sbin:/sbin
export PATH=$PATH:/home/george

# allow bash to search backwards through a history list using <C-S>
stty -ixon

# use vim as default editor for crontabs
export VISUAL=vim
    
# Entries to control history
# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=erasedups:ignoredups
export HISTSIZE=15000
export HISTFILESIZE=$HISTSIZE
# export HISTIGNORE="history *:cd *:df *:exit:fg:bg:file *:ll:ls:la:mc:top:clear"

# append to the history rather than loose most recent changes in a new terminal
shopt -s histappend
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"


print_goodbye () { 
if [ -f ~/.bash_close_session ]; then
    . ~/.bash_close_session
fi
}
trap print_goodbye EXIT 



