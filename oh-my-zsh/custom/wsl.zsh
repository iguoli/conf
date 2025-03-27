# First, you need to set an environment variable WSLENV on the Windows
# For example: WSLENV=LOCALAPPDATA/p:ProgramFiles/p:ProgramFiles(x86)/p:SystemRoot/p
# Use `ls env:` to find what environment variables are available on Windows
# Then, WSL will import these variables into the WSL environment and convert them to Unix paths automatically
export BROWSER="$ProgramFiles(x86)/Microsoft/Edge/Application/msedge.exe"

# Set the Windows IP address
export WINIP=$(ip route | awk '/default/ { print $3 }')

alias code='"$LOCALAPPDATA/Programs/Microsoft VS Code/bin/code"'
alias bcomp='"$ProgramFiles/Beyond Compare 4/BComp.exe"'
alias open="$SystemRoot/explorer.exe"
