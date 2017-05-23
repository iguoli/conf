#!/bin/bash

function show_usage() {
	echo "Usage: `basename $0` {server | client} {start | stop}"
	echo "There must be a '/etc/shadowsocks.json' as configuraion file"
	exit 1
}

if [ $# -lt 2 ]; then
	show_usage
fi

# run shadowsocks server or client
if [ $1 = 'server' ]; then
	ss='ssserver'
elif [ $1 = 'client' ]; then
	ss='sslocal'
else
	echo "$1 is a invaild parameter."
	show_usage
fi

# start or stop the proxy
if [ $2 = 'start' ] || [ $2 = 'stop' ]; then
	cmd=$2
else
	echo "$2 is a invaild parameter."
	show_usage
fi

if [ -f /etc/shadowsocks.json ]; then
	$ss -c /etc/shadowsocks.json -d $cmd
else
	echo "can not found /etc/shadowsocks.json"
	show_usage
fi
