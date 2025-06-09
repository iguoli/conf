# First, you need to set an environment variable WSLENV on the Windows
# For example: WSLENV=LOCALAPPDATA/p:ProgramFiles/p:ProgramFiles(x86)/p:SystemRoot/p
# Use `ls env:` to find what environment variables are available on Windows
# Then, WSL will import these variables into the WSL environment and convert them to Unix paths automatically
# Add cursor, vscode, beyond compare and edge to PATH
export PATH="$LOCALAPPDATA/Programs/Microsoft VS Code/bin":"$ProgramFiles (x86)/Microsoft/Edge/Application":$PATH

export BROWSER="msedge.exe"

alias open="$SystemRoot/explorer.exe"
