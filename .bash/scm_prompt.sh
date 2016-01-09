#! /usr/bin/env bash

# ANSI color codes
RS="\[\033[0m\]"    # reset
HC="\[\033[1m\]"    # hicolor
UL="\[\033[4m\]"    # underline
INV="\[\033[7m\]"   # inverse background and foreground
FBLK="\[\033[30m\]" # foreground black
FRED="\[\033[31m\]" # foreground red
FGRN="\[\033[32m\]" # foreground green
FYEL="\[\033[33m\]" # foreground yellow
FBLE="\[\033[34m\]" # foreground blue
FMAG="\[\033[35m\]" # foreground magenta
FCYN="\[\033[36m\]" # foreground cyan
FWHT="\[\033[37m\]" # foreground white
BBLK="\[\033[40m\]" # background black
BRED="\[\033[41m\]" # background red
BGRN="\[\033[42m\]" # background green
BYEL="\[\033[43m\]" # background yellow
BBLE="\[\033[44m\]" # background blue
BMAG="\[\033[45m\]" # background magenta
BCYN="\[\033[46m\]" # background cyan
BWHT="\[\033[47m\]" # background white

function is_repo {
  [ -d ".git" ]
}

function repo_is_dirty {
  [[ $(git diff --shortstat 2> /dev/null | tail -n1) != "" ]]
}

function scm_prompt {
  local invader=$(echo -e "\xf0\x9f\x91\xbe")
  local prompt="$FCYN\u$RS@$FCYN\h$RS > $FBLE\W$RS"
  local untracked_files=$(git status --porcelain 2>/dev/null| grep "^??" | wc -l)

  if is_repo; then
    branch=$(git symbolic-ref --short HEAD)

    if repo_is_dirty; then
      prompt="$prompt $FRED($branch)"
    else
      prompt="$prompt $FGRN($branch)"
    fi

    if [[ "$untracked_files" != 0 ]]; then
      prompt="$prompt$FCYN*$untracked_files"
    fi
  fi
  export PS1="$prompt$RS\n$invader  "
}
