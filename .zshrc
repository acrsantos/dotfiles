# Oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
# ZSH_THEME="robbyrussell"
# ZSH_THEME="powerlevel10k/powerlevel10k"
# plugins=(git)
source $ZSH/oh-my-zsh.sh

# Prompt
# source $HOME/.local/scripts/prompt.zsh
# source /home/adrian/.local/scripts/transient-prompt.zsh

export HISTFILE="$HOME/.zhistory"
export HISTSIZE=10000
export SAVEHIST=10000

# Alias
alias ls="eza"
alias tms="tmux-sessionizer"
alias prj=". project"
alias lg="lazygit"
alias bks=". books"
alias cfg="cd ~/dotfiles/ && nvim ."
alias gco="git switch \$(git branch -a | fzf)"
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

# Transient Prompt
# zle -N zle-line-init

# source $HOME/.local/scripts/completion.zsh
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
