# use agnoster color theme
ZSH_THEME="agnoster"

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

