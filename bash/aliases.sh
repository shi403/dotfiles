#!/bin/bash

#--- Aliases ---#
alias l='ls -l'
#alias ll='ls -la $1 | more'
function ll() {
	ls -la $1 | more
}

alias cp='cp -ip'
alias mv='mv -i'
alias rm='rm -i'

alias hi='history'
alias top='top -o cpu'

#--- Editor ---#
#if [ `uname` == "Darwin" ]; then
	#alias gvim 'env LANG=ja_JP.UTF-8 open -a /Applications/MacPorts/MacVim.app/Contents/MacOS/Vim'
#	alias  vim='/Applications/MacVim.app/Contents/MacOS/Vim'
#	alias gvim='/Applications/MacVim.app/Contents/MacOS/mvim'
#	alias  vimdiff='/Applications/MacVim.app/Contents/MacOS/vimdiff'
#	alias gvimdiff='/Applications/MacVim.app/Contents/MacOS/mvimdiff'
#fi

