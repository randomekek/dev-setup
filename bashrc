HISTCONTROL=ignoreboth
HISTSIZE=100000
HISTFILESIZE=200000
shopt -s histappend
PROMPT_COMMAND="history -a;"
alias ll='ls -alF'
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
export PS1="\[\e[0;34m\]\h \t \w>\[\e[m\] "
alias less="less -SiR"
alias grep="grep --color -i"
alias rgrep="grep --color=always -R"
alias cleangrep="egrep --color=never -v '\b(svn|log|branche|test|tag)s?\b'"
alias vless="/usr/share/vim/vim63/macros/less.sh"
alias untgz="tar -zxvf"
alias ls="ls --color"
export SVN_EDITOR=nano

