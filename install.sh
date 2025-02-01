# ble.sh
# https://github.com/akinomyoga/ble.sh
if [ ! -d ~/.local/share/blesh ]; then
    git clone --recursive --depth 1 --shallow-submodules https://github.com/akinomyoga/ble.sh.git ble.sh
    make -C ble.sh install PREFIX=~/.local
    rm -rf ble.sh
fi
