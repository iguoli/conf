# alias l='ls -lhF --time-style=long-iso --color=auto'
# alias ll='ls -lhF --time-style=long-iso --color=auto'
# alias la='ls -lhAF --time-style=long-iso --color=auto'
alias tree="tree -C"
alias goproxy="export http_proxy=http://localhost:7890 https_proxy=http://localhost:7890 all_proxy=socks5://localhost:7890 no_proxy='localhost, 127.0.0.1'"
alias noproxy="unset all_proxy http_proxy https_proxy no_proxy"

type nvim >/dev/null 2>&1 && alias vim="nvim"
