# Syntax highlight output
if type pygmentize >/dev/null; then
    export LESSOPEN="|pygmentize -g -O style=solarized-dark %s"
fi
