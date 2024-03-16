#!/usr/bin/env zsh

local PR_USER PR_USER_OP PR_PROMPT PR_HOST

# Check the UID
if [[ $UID -ne 0 ]]; then # normal user
  PR_USER='%F{123}%n%f'
  PR_USER_OP='%F{white}%#%f'
  PR_PROMPT='%F{123}❱ %f'
else # root
  PR_USER='%F{red}%n%f'
  PR_USER_OP='%F{red}%#%f'
  PR_PROMPT='%F{red}❯ %f'
fi

# Check if we are on SSH or not
if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then
  PR_HOST='%F{red}%M%f' # SSH
else
  PR_HOST='%F{007}%m%f' # no SSH
fi


local return_code="%(?..%F{red}%? ↵%f)"

local user_host="${PR_USER}%F{cyan}@${PR_HOST}"
local current_dir="%B%F{123}%~%f%b"
local git_branch='$GITSTATUS_PROMPT'

source ~/Downloads/gistatus/gitstatus.prompt.zsh
#source $HOME/Downloads/gistatus/gitstatus.plugin.zsh
# PROMPT="╭─ %T | ${user_host}: [${current_dir}] \$(ruby_prompt_info) ${git_branch}
# ╰──$PR_PROMPT "
PROMPT="╭─ ${user_host} [${current_dir}] \$(ruby_prompt_info) ${git_branch}
╰─$PR_PROMPT "
RPROMPT="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%F{yellow}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %f"
ZSH_THEME_RUBY_PROMPT_PREFIX="%F{red}‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="›%f"

export zle-line-init() {
emulate -L zsh

[[ $CONTEXT == start ]] || return 0

while true; do
    zle .recursive-edit
    local -i ret=$?
    [[ $ret == 0 && $KEYS == $'\4' ]] || break
    [[ -o ignore_eof ]] || exit 0
done

local saved_prompt=$PROMPT
local saved_rprompt=$RPROMPT
PROMPT='%F{118}❱ %f'
RPROMPT=''
zle .reset-prompt
PROMPT=$saved_prompt
RPROMPT=$saved_rprompt

if (( ret )); then
    zle .send-break
else
    zle .accept-line
fi
return ret
}

