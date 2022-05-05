#! /usr/bin/env bash

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
#ignorespace+ignoredups = ignoreboth
export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=2000
function share_history {
	history -a
	history -c
	history -r
}
PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'share_history'
#export HISTTIMEFORMAT='%Y/%m/%d %T '
export HISTIGNORE="fg*:bg*:history*:cd"

