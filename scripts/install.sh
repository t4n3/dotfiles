# Install ble.sh
# https://github.com/akinomyoga/ble.sh
if [ ! -d ~/.local/share/blesh ]; then
    git clone --recursive --depth 1 --shallow-submodules https://github.com/akinomyoga/ble.sh.git ble.sh
    make -C ble.sh install PREFIX=~/.local
    rm -rf ble.sh
    echo "Installed ble.sh"
fi


# SYMLINKS
if [ ! -f ~/.blerc ]; then
    ln -s ~/dotfiles/blerc ~/.blerc
    echo "Created symlink for blerc"
fi

if [ ! -d ~/.config/nvim ]; then
    ln -s ~/dotfiles/nvim ~/.config/nvim
    echo "Created symlink for nvim"
fi

if [ ! -d ~/.config/kitty ]; then
    ln -s ~/dotfiles/kitty ~/.config/kitty
    echo "Created symlink for kitty"
fi

if [ ! -d ~/.config/tmux ]; then
    ln -s ~/dotfiles/tmux/ ~/.config/tmux
    echo "Created symlink for tmux"
fi

