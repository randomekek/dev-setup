bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward
bindkey "^[[H" beginning-of-line
bindkey "^[[1~" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[4~" end-of-line
bindkey "^[[3~" delete-char
bindkey ";5D" backward-word
bindkey "^[[1;5D" backward-word
bindkey ";5C" forward-word
bindkey "^[[1;5C" forward-word
setopt NO_AUTO_MENU
setopt HIST_IGNORE_SPACE
setopt INC_APPEND_HISTORY
#alias vim=/Applications/MacVim.app/Contents/bin/vim
