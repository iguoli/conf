# alias l='ls -lhF --time-style=long-iso --color=auto'
# alias ll='ls -lhF --time-style=long-iso --color=auto'
# alias la='ls -lhAF --time-style=long-iso --color=auto'
#

# Set proxy_url from variable $MYPROXY if it exists, otherwise use 127.0.0.1:7890
proxy_url=${MYPROXY:-127.0.0.1:7890}

alias goproxy="export \
	http_proxy=proxy_url \
	https_proxy=proxy_url \
	all_proxy=socks5://127.0.0.1:7890 \
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
