#!/bin/sh
# check which operating system we're on

if [ "$(uname)" == "Darwin" ]; then
    source setup_darwin.sh
elif [ "$(uname)" == "Linux" ]; then
    source setup_linux.sh
fi

if ! command -v zsh >/dev/null; then
    echo "zsh not found. Please install and then re-run installation scripts"
    exit 1
elif ! [[ $SHELL =~ .*zsh.* ]]; then
    echo "Configuring zsh as default shell"
    chsh -s $(which zsh)
fi

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


