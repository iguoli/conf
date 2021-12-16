# Homebrew autocompletion funciton
if type brew >/dev/null 2>&1; then;
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

# pyenv
if type pyenv >/dev/null 2>&1; then;
    eval "$(pyenv init --path)"
fi

