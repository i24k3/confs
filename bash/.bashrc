# only run the settings if the shell is active
[[ $- != *i* ]] && return

# colors
RED="\[\e[31m\]"
GREEN="\[\e[32m\]"
YELLOW="\[\e[33m\]"
BLUE="\[\e[34m\]"
MAGENTA="\[\e[35m\]"
CYAN="\[\e[36m\]"
RESET="\[\e[0m\]"

# text decor
BOLD="\[\e[1m\]"

# git branch parsr
parse_git_branch() {
  git branch 2>/dev/null | sed -n '/\* /s///p'
}

# PS1 setup 
PS1="${GREEN}(${RESET}${BLUE}\${PWD##*/}${RESET}${GREEN})${RESET}:${YELLOW}[\$(parse_git_branch)]${RESET} ${BOLD}>${RESET} "


# for usual commands
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ll="lsd -lah"

#for tmux
alias tmuxn="tmux new -s"
alias tmuxa="tmux attach -t"
alias tmuxk="tmux kill-session -t"
alias tmuxs="tmux switch -t"
alias tmuxu="tmux source-file ~/.tmux.conf"

# for zoxide
alias zu="zoxide query --list"
alias zi="zoxide query -i"


# use zoxide
eval "$(zoxide init bash)"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


