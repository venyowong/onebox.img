#!/bin/sh

apk update
echo "installing aria2..."
apk add luci-app-aria2
echo "installing samba4..."
apk add luci-app-samba4
echo "installing shadow..."
apk add shadow
echo "configuring uhttpd..."
uci -q delete uhttpd.main.listen_http
uci -q delete uhttpd.main.listen_https
uci add_list uhttpd.main.listen_http="0.0.0.0:81"
uci add_list uhttpd.main.listen_http="[::]:81"
uci commit uhttpd
/etc/init.d/uhttpd restart
echo "installing lrzsz..."
apk add lrzsz
echo "installing unzip..."
apk add unzip