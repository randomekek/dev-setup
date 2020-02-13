# improve history
HISTCONTROL=ignoreboth
HISTSIZE=100000
HISTFILESIZE=200000
shopt -s histappend
PROMPT_COMMAND="history -a;"

# shortcuts and config
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
alias untgz='tar -zxvf'
alias :e='vim'
export LESS="-SRi"
export PROMPT_DIRTRIM=3
function vimg() {
  cd $(git rev-parse --show-toplevel)
  vim $(git status --porcelain | awk '{print $2}')
}

# disable ctrl+s
stty -ixon
# expand tabs immediately
set show-all-if-ambiguous on

# prompt
export PS1='\[\e[38;2;38;139;210m\]\t \w\[\e[0m\]$(__git_ps1 " \[\e[38;2;211;54;130m\][%s]\[\e[0m\]") '
# export PS1='\[\e[0;34m\]\h \t \w>\[\e[m\] '
