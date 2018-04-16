#!/bin/sh
# set up file for OS X

echo "Setting up for OS X"
if ! command -v brew >/dev/null; then
    echo "Installing Homebrew ..."
    curl -fsS \
    'https://raw.githubusercontent.com/Homebrew/install/master/install' | ruby

    export PATH="/usr/local/bin:$PATH"
fi

if ! command -v vim >/dev/null; then
    brew install vim
fi
if ! command -v git >/dev/null; then
    brew install git
fi
if ! command -v tmux >/dev/null; then
    brew install tmux
fi
if ! command -v zsh >/dev/null; then
    brew install zsh
fi

echo "installed everything!"

