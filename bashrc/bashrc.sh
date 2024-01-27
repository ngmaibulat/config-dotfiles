export PS1='\033[01;32m\u@\h\033[00m:\033[01;34m\w\033[00m\$ '
export PS1='\[\033[1;32;40m\]\h\[\033[0;37;40m\]:\[\033[31;40m\][\[\033[1;34;40m\]\u\[\033[0;31;40m\]]\[\033[0;37;40m\]:\[\033[35;40m\]\w\[\033[1;33;40m\]$\[\033[0m\] '

export HISTCONTROL=ignoreboth
export HISTTIMEFORMAT="%Y-%m-%d %T "
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias ip='ip --color=auto'
alias feh='feh --scale-down'
alias tb='nc termbin.com 9999'

setfont ter-c32n
clear

