
# no vim mode
#set -o vi

# shopt -s autocd
# shopt -s direxpand

# stty -ixon

export PATH="$PATH:/home/nuutti/tools/bin"
EDITOR=nvim


alias l="lsd -Al"
alias t="touch"
alias e=$EDITOR
alias rm="trash-put"
alias ryujinx="~/Games/Ryujinx/Ryujinx.sh" 
alias editbashrc="nvim ~/dotfiles/bashrc && source ~/dotfiles/bashrc"
alias editinputrc="nvim ~/dotfiles/inputrc && bind -f ~/dotfiles/inputrc"
alias editnvim="cd ~/dotfiles/nvim && nvim && cd -"
alias cdi="__zoxide_zi"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias getpublicip="curl -s -4 ifconfig.me | tee /dev/tty | xsel --clipboard --input; echo"


cd() {
    __zoxide_z "${1:-$HOME}" || return 1

    clear
    # print if ls fits within 1 row
    if [ "$(lsd | wc -c)" -le "$(( $(tput cols) * 10 ))" ]; then
        lsd
    fi
}
-() {
    cd -
}
mk() {
  mkdir -p "$1" && cd "$1"
}


# Prompt
# https://bash-prompt-generator.org/
source ~/dotfiles/scripts/git-prompt.sh
PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 " (%s)")'; PS1='\[\e[38;5;243m\]$?\[\e[0m\] \[\e[38;5;87m\]\w\[\e[38;5;251m\]${PS1_CMD1}\[\e[0m\] \[\e[38;5;225m\]\[\e[0m\] '


# zoxide
eval "$(zoxide init bash --no-cmd)"
# fzf
eval "$(fzf --bash)"

# History
export HISTCONTROL=eradedups:ignorespace

