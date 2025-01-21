

# Vim mode
set -o vi


EDITOR=nvim


# Aliases
alias l="ls -al"
alias t="touch"
alias sos="source ~/dotfiles/bashrc"

mk() {
  mkdir -p "$1" && cd "$1"
}


# Prompt
source ~/dotfiles/scripts/git-prompt.sh
PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 " (%s)")'; PS1='\[\e[38;5;243m\]$?\[\e[0m\] \[\e[38;5;87m\]\w\[\e[38;5;251m\]${PS1_CMD1}\[\e[0m\] \[\e[38;5;225m\]\[\e[0m\] '

# zoxide
eval "$(zoxide init bash --cmd cd)"
