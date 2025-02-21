# Syntax highlight output when using less
if type pygmentize >& /dev/null; then
    export LESSOPEN="|pygmentize -g -O style=solarized-dark %s"
fi
