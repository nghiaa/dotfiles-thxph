if [ "x$OH_MY_ZSH_HG" = "x" ]; then
    OH_MY_ZSH_HG="hg"
fi

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

function hg_prompt_info {
    $OH_MY_ZSH_HG prompt --angle-brackets "\
< on %{$fg[magenta]%}<branch>%{$reset_color%}>\
< at %{$fg[yellow]%}<tags|%{$reset_color%}, %{$fg[yellow]%}>%{$reset_color%}>\
%{$fg[green]%}<status|modified|unknown><update>%{$reset_color%}<
patches: <patches|join( → )|pre_applied(%{$fg[yellow]%})|post_applied(%{$reset_color%})|pre_unapplied(%{$fg_bold[black]%})|post_unapplied(%{$reset_color%})>>" 2>/dev/null
}

function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || hostname -s
}

[[ -f /proc/apm ]] && p_apm="%(2v.-%2v-.)"
p_shlvl="%{$fg[white]%}%(2L.$SHLVL/.)"
p_rc="%{$fg[white]%}[%?%1v] "
p_end="%{$fg[white]%}%B%#%b"

#ptime='[%D{%T}]'

PROMPT='$p_shlvl%{$fg[magenta]%}%n%{$reset_color%}@%{$fg[yellow]%}$(box_name)%{$reset_color%}:%{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info)
$p_rc$p_apm$p_end%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="|%{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

#local return_status="%{$fg[red]%}%(?..⏎)%{$reset_color%}"
#RPROMPT='${return_status}%{$reset_color%}'


#RPROMPT='%D{%H:%M:%S}'

# this messes with other zle stuff
#TMOUT=1
#TRAPALRM() {
#  #echo $PROMPT
#  zle reset-prompt
#}

