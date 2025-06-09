# alias l='ls -lhF --time-style=long-iso --color=auto'
# alias ll='ls -lhF --time-style=long-iso --color=auto'
# alias la='ls -lhAF --time-style=long-iso --color=auto'
alias tree="tree -C"

# Get the Windows host IP address
export WINIP=$(ip route | awk '/default/ { print $3 }')

alias goproxy="export http_proxy=http://$WINIP:7890 https_proxy=http://$WINIP:7890 all_proxy=socks5://$WINIP:7890 no_proxy='localhost, 127.0.0.1'"
alias noproxy="unset all_proxy http_proxy https_proxy no_proxy HTTP_PROXY HTTPS_PROXY NO_PROXY WSL_PAC_URL"

type nvim >/dev/null 2>&1 && alias vim="nvim"
