# alias l='ls -lhF --time-style=long-iso --color=auto'
# alias ll='ls -lhF --time-style=long-iso --color=auto'
# alias la='ls -lhAF --time-style=long-iso --color=auto'
#
alias goproxy="export \
	http_proxy=http://$WINIP:7890 \
	https_proxy=http://$WINIP:7890 \
	all_proxy=socks5://$WINIP:7890 \
	no_proxy='localhost, 127.0.0.1'"

alias noproxy="unset \
	all_proxy \
	http_proxy \
	https_proxy \
	no_proxy \
	ALL_PROXY \
	HTTP_PROXY \
	HTTPS_PROXY \
	NO_PROXY"

alias tree="tree -C"

type nvim >/dev/null 2>&1 && alias vim="nvim"
