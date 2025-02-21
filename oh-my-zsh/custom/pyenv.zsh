# pyenv
if type pyenv >& /dev/null; then
    eval "$(pyenv init -)"
fi

# pyenv-virtualenv
if type pyenv >& /dev/null; then
    eval "$(pyenv virtualenv-init -)"
fi
