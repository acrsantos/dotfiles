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
alias cfg="cd ~/dotfiles/ && nvim ."
alias gco="git switch \$(git branch | fzf)"
alias gco!="git checkout -b"
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

# FZF
#https://vitormv.github.io/fzf-themes#eyJjb2xvcnMiOiJmZys6I2ZmZmZmZixiZys6IzE0MTYxYixobDojNWY4N2FmLGhsKzojNWVkYWZmLGluZm86I2IyZmZhMixtYXJrZXI6IzdhYmEzOSxwcm9tcHQ6IzI2YmFkMSxzcGlubmVyOiNiNzE0MWUscG9pbnRlcjojZmVlOTJlLGhlYWRlcjojODdhZmIwLGJvcmRlcjojMDBmZmY3LGxhYmVsOiNhZWFlYWUscXVlcnk6I2Q5ZDlkOSJ9
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color=fg:-1,fg+:#ffffff,bg:-1,bg+:#14161b
  --color=hl:#5f87af,hl+:#5edaff,info:#b2ffa2,marker:#7aba39
  --color=prompt:#26bad1,spinner:#b7141e,pointer:#fee92e,header:#87afb0
  --color=border:#00fff7,label:#aeaeae,query:#d9d9d9
  --border="rounded" --border-label="" --preview-window="border-rounded" --prompt="> "
  --marker=">" --pointer="◆" --separator="─" --scrollbar="│"'
