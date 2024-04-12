# pyenv
if type pyenv >/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi

# pyenv-virtualenv
if type pyenv-virtualenv >/dev/null 2>&1; then
    eval "$(pyenv virtualenv-init -)"
fi
