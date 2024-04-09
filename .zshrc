# Oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
# ZSH_THEME="robbyrussell"
# ZSH_THEME="powerlevel10k"
DISABLE_AUTO_TITLE="true"
plugins=(git)
source $ZSH/oh-my-zsh.sh


# Prompt
source $HOME/.local/scripts/prompt.zsh

# Alias
alias tms="tmux-sessionizer"
alias prj=". project"
alias lg="lazygit"
alias bks=". books"
alias cfg="cd ~/dotfiles/ && nvim ."
alias gco="git switch \$(git branch -a | fzf)"
alias gco!="git checkout -b"
alias nvim="$HOME/.local/scripts/vim"
alias vim="$HOME/.local/scripts/vim"
alias clangf="clang-format -style='{BasedOnStyle: LLVM, IndentWidth: 4}' -dump-config > .clang-format"
alias dm="dmenu_run"

# FZF
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
    --color dark,hl:33,hl+:37,fg+:235,bg+:136,fg+:254
    --color info:254,prompt:37,spinner:108,pointer:235,marker:235
'

# Transient Prompt
zle -N zle-line-init

# Zoxide
eval "$(zoxide init zsh)"
