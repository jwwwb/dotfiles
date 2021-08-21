export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH=$HOME/.oh-my-zsh
plugins=(
  git
)


# use agnoster color theme
ZSH_THEME="agnoster"

source $ZSH/oh-my-zsh.sh

# disable shell blocking, passing through ctrl+s to vim
stty -ixon

# jump straight into tmux if possible
if type tmux >/dev/null 2>/dev/null; then
    # you can start tmux if you want
    if ! { [ -n "$TMUX" ]; } then
        tmux -2 new-session -A -s main
    fi
fi

# short prompt
prompt_dir() {
    prompt_segment blue black '%c'
}

# extra git commands
alias gqa='git checkout qa && git pull && git merge --no-edit @{-1} && git push && git checkout -'
alias gsp='git stash pop'
alias gsk='git stash -k -u'
alias gmm='git merge --no-edit'

# aliases for short commands
alias p='python3'
alias i='ipython'
alias pi='python3 -i'
alias j='jupyter notebook'
alias e='vim'

