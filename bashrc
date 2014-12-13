# fixing history to work like expected
HISTCONTROL=ignoreboth
HISTSIZE=100000
HISTFILESIZE=200000
shopt -s histappend
PROMPT_COMMAND="history -a;"

# useful features
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
alias vless="/usr/share/vim/vim63/macros/less.sh"
alias untgz="tar -zxvf"

# this seems to fix solarized color issues inside tmux
alias tmux="TERM=xterm-256color tmux"

# these colors require 24-bit color support in the in the terminal                                 
BG_COLOR="\[\e[48;2;38;41;44m\]"
TEXT_FG_COLOR="\[\e[38;2;224;224;224m\]"
PROMPT_FG_COLOR="\[\e[38;2;118;185;118m\]"
export PS1="$BG_COLOR$PROMPT_FG_COLOR\t \w> $TEXT_FG_COLOR"

# this uses some normal colors
export PS1="\[\e[0;34m\]\h \t \w>\[\e[m\] "
