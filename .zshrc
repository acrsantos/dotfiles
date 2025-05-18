export ZSH="$HOME/.oh-my-zsh"
plugins=(git)
source $ZSH/oh-my-zsh.sh

export HISTFILE="$HOME/.zhistory"
export HISTSIZE=10000
export SAVEHIST=10000

# Alias
alias lg="lazygit"
alias bks=". books"
alias vim="nvim"
alias ta="tmux-attach"
alias tta="tmux-dir add"
alias ttr="tmux-dir remove"
alias clangf="clang-format -style='{BasedOnStyle: LLVM, IndentWidth: 4}' -dump-config > .clang-format"
alias py="python"

# FZF
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
export FZF_DEFAULT_OPTS='--height 50% --layout=reverse-list --border sharp'
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock

export MANPAGER='nvim +Man!'

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}
bindkey -s '^o' 'y\n'  # zsh
bindkey -s '^e' 'dev-dir.sh\n'  # zsh
tmux() {
    if [ "$#" -eq 0 ]; then
        session_name=$(basename "$PWD")
        command tmux new -s "$session_name"
    else
        command tmux "$@"
    fi
}
