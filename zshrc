# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export ZSH_THEME=""
fpath+=($HOME/.zsh/pure)

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# export DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
    golang \
    lol \
    compleat \
    history \
    scd \
    aws \
    docker \
    colored-man-pages \
    zsh-navigation-tools \
    colorize \
    extract \
    python \
    git \
    vi-mode \
    zsh-syntax-highlighting \
    thxph-fzf \
    thanh)
if uname | grep Darwin >> /dev/null; then
    plugins+=(macos)
elif uname | grep Linux >> /dev/null; then
    plugins+=(copydir copybuffer)
fi

if [ -f $HOME/.zshrc-tlocal ]; then
    source $HOME/.zshrc-tlocal
fi

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

source $ZSH/oh-my-zsh.sh
autoload -U promptinit; promptinit
prompt pure