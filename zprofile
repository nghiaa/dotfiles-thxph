#!/usr/bin/env zsh

if uname | grep Darwin >> /dev/null; then
    # override path order in /etc/zprofile
    path=( $path_prepend $path $path_append)
    typeset -U path
fi

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"