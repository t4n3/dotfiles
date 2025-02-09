
# SYMLINKS
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

if [ ! -f ~/.inputrc ]; then
    ln -s ~/dotfiles/inputrc ~/.inputrc
    echo "Created symlink for inputrc"
fi

if [ ! -f ~/.bashrc ]; then
    ln -s ~/dotfiles/bashrc ~/.bashrc
    echo "Created symlink for bashrc"
fi
