#!/usr/bin/env bash
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

if [ -e $HOME/.vimrc ]; then
    echo ".vimrc already exists, delete or rename first"
else
    ln -s $(pwd)/vimrc $HOME/.vimrc
    echo "symlinked .vimrc"
fi

if [ -e $HOME/.tmux.conf ]; then
    echo ".tmux.conf already exists, delete or rename first"
else
    ln -s $(pwd)/tmux.conf $HOME/.tmux.conf
    echo "symlinked .tmux.conf"
fi

if [ -e $HOME/.zshrc ]; then
    rm $HOME/.zshrc
    ln -s $(pwd)/zshrc $HOME/.zshrc
    echo ".zshrc already exists, deleting and then symlinking."
else
    ln -s $(pwd)/zshrc $HOME/.zshrc
    echo "symlinked .zshrc"
fi

ln -s $(pwd)/gitignore_global $HOME/.gitignore_global
echo "symlinked .gitignore_global"

# clone and install powerline fonts
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts

# install vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# setup git details
git config --global user.name jwwwb
git config --global user.email james@jwwwb.com
git config --global core.excludesFile '~/.gitignore_global'

