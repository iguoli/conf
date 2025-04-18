# https://github.com/step-cli/step
# bring step completion into effect
if type step &> /dev/null; then
    eval "$(step completion zsh)"
fi
