HISTCONTROL=ignoreboth
HISTSIZE=100000
HISTFILESIZE=200000
shopt -s histappend
PROMPT_COMMAND="history -a;"
alias ll='ls -alF'
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
export PS1="\[\e[0;34m\]\h \t \w>\[\e[m\] "
alias vless="/usr/share/vim/vim63/macros/less.sh"
alias untgz="tar -zxvf"
# this seems to fix solarized color issues inside tmux
alias tmux="TERM=xterm-256color tmux"
