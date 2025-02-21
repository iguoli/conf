alias code='/mnt/c/Users/lguo5/AppData/Local/Programs/Microsoft VS Code/bin/code'
alias edge='/mnt/c/Program Files (x86)/Microsoft/Edge/Application/msedge.exe'
alias bcomp='/mnt/c/Program Files/Beyond Compare 4/BComp.exe'
alias open='/mnt/c/Windows/explorer.exe'

let g:clipboard = {
            \   'name': 'WslClipboard',
            \   'copy': {
            \      '+': 'clip.exe',
            \      '*': 'clip.exe',
            \    },
            \   'paste': {
            \      '+': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
            \      '*': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
            \   },
            \   'cache_enabled': 0,
            \ }
