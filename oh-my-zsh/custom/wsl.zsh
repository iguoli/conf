# Set environment variable WSLENV on the Windows to import windows environment variables
# Use `ls env:` to find the environment varialbe names on Windows
# For example: WSLENV=LOCALAPPDATA/p:ProgramFiles/p:ProgramFiles(x86)/p:SystemRoot/p
export BROWSER="$ProgramFiles(x86)/Microsoft/Edge/Application/msedge.exe"

alias code='"$LOCALAPPDATA/Programs/Microsoft VS Code/bin/code"'
alias bcomp='"$ProgramFiles/Beyond Compare 4/BComp.exe"'
alias open="$SystemRoot/explorer.exe"
