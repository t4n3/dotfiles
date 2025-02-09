
# no vim mode
#set -o vi

# shopt -s autocd
# shopt -s direxpand

# stty -ixon

EDITOR=nvim


alias l="lsd -Al"
alias t="touch"
alias ryujinx="~/Games/Ryujinx/Ryujinx.sh" 
alias editbashrc="nvim ~/dotfiles/bashrc && source ~/dotfiles/bashrc"
alias editinputrc="nvim ~/dotfiles/inputrc && bind -f ~/dotfiles/inputrc"
alias editnvim="cd ~/dotfiles/nvim && nvim && cd -"
alias cdi="__zoxide_zi"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias getpublicip="curl -s -4 ifconfig.me | tee /dev/tty | xsel --clipboard --input; echo"


# Custom file manager with fzf maybe..?
# I'm too drunk for this at the moment
# TODO: tee jtn järkevää tähän!
cdf() {
    # If file; edit it
    if [ -f "$1" ]; then
        echo "FILE $1"
    # Else go to dir
    else
        if [ -d "$1" ]; then
            cd "$1"
        fi
        cdf "$1"
    fi


    # No arg
    #if [ -z "$1" ]; then
    #    SELECTTION="$(ls | fzf)"
    #    if [ "$?" -eq 0 ]; then
    #        cdf "$SELECTTION"
    #    else
    #        echo "pressed esc"
    #    fi
    #else
    #    # Arg dir
    #    if [ -d "$1" ]; then
    #        # go into dir
    #        builtin cd "$1"
    #        SELECTTION="$(ls | fzf)"
    #        if [ "$?" -eq 0 ]; then
    #            cdf "$SELECTTION"
    #        else
    #            echo "pressed esc"
    #        fi
    #        cdf "$SELECTTION"
    #    # Arg file
    #    elif [ -f "$1" ]; then
    #        # nvim file
    #        # for now echo file
    #        echo "$1"

    #    else
    #        echo "mitä vittua!?"
    #    fi


    #fi



   # if [ -z "$1" ]; then
   # # if there is no $1 ls
   #     SELECTION=$(ls | fzf)
   #     echo "$SELECTION"
   # else
   #     # if $1 is dir = ls that dir 
   #     if [ -d "$1" ]; then
   #         SELECTION=$(ls "$1" | fzf)
   #         cdf "$SELECTION"
   #     # if $1 is file nvim to that file
   #     elif [ -f "$1" ]; then
   #         echo "FILE $SELECTION"
   #     else
   #         echo "Mitä vittua nyt taas!!?"
   #     fi
   # fi
    


    #if [ -z "$1" ]; then
    #    SELECTION=$(ls | fzf)
    #else
    #    SELECTION="$1"
    #fi

    #if [ -f "$SELECTION" ]; then
    #    echo "$SELECTION"
    #elif [ -d "$SELECTION" ]; then
    #    cdf "$SELECTION"
    #else
    #    echo "Something went wrong?"
    #fi
}
cd() {
    __zoxide_z "${1:-$HOME}" || return 1

    echo ""
    # print if ls fits within 1 row
    if [ "$(lsd | wc -c)" -le "$(( $(tput cols) * 6 ))" ]; then
        clear
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

