# save history immediately
shopt -s histappend
PROMPT_COMMAND="history -a;"

# save a lot of history
HISTSIZE=100000
HISTFILESIZE=200000

# do not save space prefix and repeated commands
HISTCONTROL=ignorespace:ignoredups

# make up and down sensible
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# improve less (chop long lines, don't mess colors, case insensitive search)
export LESS="-SRi"

# disable ctrl+s
stty -ixon

# expand tabs immediately
set show-all-if-ambiguous on

# prompt
export PS1='\[\e[38;2;38;139;210m\]\t \w\[\e[0m\]$(__git_ps1 " \[\e[38;2;211;54;130m\][%s]\[\e[0m\]") '

# prompt directory truncate
export PROMPT_DIRTRIM=3
