#!/usr/bin/env zsh

dir=$(fd --max-depth 1 --type d -E '{build,src,.cache,.git,.github}' . "$HOME/dev")
dir+="\n"$(cat "$HOME/.tmux-dir")
selected=$(echo $dir | fzf --delimiter / --with-nth=5.. --preview 'eza --tree --level=2 {}' | sed 's/\/$//')

if [[ -z $selected ]]; then
    exit 0
fi

exec zsh -c "cd '$selected'; exec zsh"
