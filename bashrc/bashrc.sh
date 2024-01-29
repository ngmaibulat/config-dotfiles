export PS1='\033[01;32m\u@\h\033[00m:\033[01;34m\w\033[00m\$ '
export PS1='\[\033[1;32;40m\]\h\[\033[0;37;40m\]:\[\033[31;40m\][\[\033[1;34;40m\]\u\[\033[0;31;40m\]]\[\033[0;37;40m\]:\[\033[35;40m\]\w\[\033[1;33;40m\]$\[\033[0m\] '

export HISTCONTROL=ignoreboth
export HISTTIMEFORMAT="%Y-%m-%d %T "
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

alias ls='lsd --color always -l --icon never --group-dirs first'
alias ll='lsd --color always -l --icon never --group-dirs first'

alias grep='grep   --color=always'
alias egrep='egrep --color=always'
alias fgrep='fgrep --color=always'

alias ip='ip --color=always'
alias feh='feh --scale-down'
alias tb='nc termbin.com 9999'

alias extract-mp3='yt-dlp -x --audio-format mp3'

setfont ter-c32n
clear

