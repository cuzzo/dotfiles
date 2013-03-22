#!/usr/bin/env bash

# based off of n0qorg
# looks like, if you're in a git repo:
# ± [user] ~/path/to (branch ✓) $
# in glorious white / yellow / yellow color scheme

prompt_setter() {
  # Save history
  history -a
  history -c
  history -r
  PS1="${white}$(scm_char) ${purple}[\u] ${normal}\W$(scm_prompt_info)${normal}:\$ "
  PS2='> '
  PS4='+ '
}

PROMPT_COMMAND=prompt_setter

unset GIT_THEME_PROMPT_PREFIX
unset GIT_THEME_PROMPT_SUFFIX
unset GIT_THEME_PROMPT_DIRTY
unset GIT_THEME_PROMPT_CLEAN

SCM_THEME_TEMPLATE_GIT="PTBS"
SCM_THEME_TEMPLATE_SVN="PTBS"
SCM_THEME_TEMPLATE_HG="PTBCS"

SCM_NONE_CHAR='-'
SCM_THEME_PROMPT_DIRTY="${red}"
SCM_THEME_PROMPT_CLEAN="${green}"
SCM_THEME_PROMPT_PREFIX=" ${purple}("
SCM_THEME_PROMPT_SUFFIX="${purple})"
RVM_THEME_PROMPT_PREFIX=" ("
RVM_THEME_PROMPT_SUFFIX=")"
