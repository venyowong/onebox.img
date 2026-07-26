#!/bin/sh

apk update
apk add luci-app-aria2
apk add ffmpeg
apk add rpcd-mod-file
/etc/init.d/rpcd restart
apk add luci-app-samba4
apk add shadow
cat > /usr/share/rpcd/acl.d/onebox-samba.json << 'EOF'
{
    "onebox-samba": {
        "description": "OneBox samba user management",
        "read": {
            "file": {
                "/bin/sh": ["exec"],
                "/usr/sbin/useradd": ["exec"],
                "/usr/sbin/userdel": ["exec"],
                "/usr/bin/smbpasswd": ["exec"],
                "/usr/bin/pdbedit": ["exec"]
            }
        },
        "write": {
            "file": {
                "/bin/sh": ["exec"],
                "/usr/sbin/useradd": ["exec"],
                "/usr/sbin/userdel": ["exec"],
                "/usr/bin/smbpasswd": ["exec"],
                "/usr/bin/pdbedit": ["exec"]
            }
        }
    }
}
EOF
uci add_list rpcd.@login[-1].read='onebox-samba'
uci add_list rpcd.@login[-1].write='onebox-samba'
uci commit rpcd
/etc/init.d/rpcd restart
uci -q delete uhttpd.main.listen_http
uci -q delete uhttpd.main.listen_https
uci add_list uhttpd.main.listen_http="0.0.0.0:81"
uci add_list uhttpd.main.listen_http="[::]:81"
uci commit uhttpd
/etc/init.d/uhttpd restart
apk add lrzsz
apk add unzip