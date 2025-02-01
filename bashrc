
# set up ble
[[ $- == *i* ]] && source ~/.local/share/blesh/ble.sh --noattach

# vim mode
if [[ $- == *i* ]]; then
  set -o vi
fi

EDITOR=nvim


# Aliases {{{
alias l="ls -al"
alias t="touch"
alias ryujinx="~/Games/Ryujinx/Ryujinx.sh" 
alias editbashrc="nvim ~/dotfiles/bashrc && source ~/dotfiles/bashrc"
alias editnvim="cd ~/dotfiles/nvim && nvim && cd -"
alias cdi="__zoxide_zi"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
# }}}

# Functions {{{
cd() {
    __zoxide_z "${1:-$HOME}" || return 1

    echo ""
    # print if ls fits within 1 row
    if [ "$(ls | wc -c)" -le "$(tput cols)" ]; then
        ls
    fi
}
-() {
    cd -
}
mk() {
  mkdir -p "$1" && cd "$1"
}
# }}}


# Prompt
source ~/dotfiles/scripts/git-prompt.sh
PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 " (%s)")'; PS1='\[\e[38;5;243m\]$?\[\e[0m\] \[\e[38;5;87m\]\w\[\e[38;5;251m\]${PS1_CMD1}\[\e[0m\] \[\e[38;5;225m\]\[\e[0m\] '

# zoxide
eval "$(zoxide init bash --no-cmd)"
# fzf
eval "$(fzf --bash)"

# History
export HISTCONTROL=eradedups:ignorespace

# enable ble
[[ ! ${BLE_VERSION-} ]] || ble-attach
