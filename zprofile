#!/usr/bin/env zsh

if uname | grep Darwin >> /dev/null; then
    # override path order in /etc/zprofile
    path=( $path_prepend $path $path_append)
    typeset -U path
fi
# Setting PATH for Python 3.11
# The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.11/bin:${PATH}"
export PATH
