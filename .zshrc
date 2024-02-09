xset r rate 200 50

# Oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
# ZSH_THEME="robbyrussell"
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
alias vim="nvim"
alias kvim="NVIM_APPNAME=kvim nvim"
alias clangf="clang-format -style='{BasedOnStyle: LLVM, IndentWidth: 4}' -dump-config > .clang-format"

# FZF
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock

# Transient Prompt
zle -N zle-line-init

# Zoxide
eval "$(zoxide init zsh)"

