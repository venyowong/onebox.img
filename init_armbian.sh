#!/bin/sh

sudo apt update
echo "installing samba..."
sudo apt install samba samba-common-bin smbclient cifs-utils -y
echo "installing avahi-daemon..."
sudo apt install avahi-daemon
echo "installing hd-idle..."
sudo apt install -y hd-idle
cat > /etc/default/hd-idle <<EOF
HD_IDLE_OPTS="-a -i 86400 -l /var/log/hd-idle.log"
EOF
systemctl enable hd-idle
systemctl restart hd-idle
echo "installing aria2..."
sudo apt install -y aria2
mkdir -p /cloud/download
chmod 777 /cloud/download
mkdir -p /etc/aria2
touch /etc/aria2/aria2.session
chmod 666 /etc/aria2/aria2.session
cat > /etc/aria2/aria2.conf <<EOF
dir=/cloud/download
disk-cache=32M
continue=true
enable-rpc=true
rpc-allow-origin-all=true
rpc-listen-all=true
rpc-listen-port=6800
max-concurrent-downloads=5
max-connection-per-server=16
min-split-size=10M
split=20
listen-port=51413
enable-dht=true
dht-listen-port=6881-6999
save-session=/etc/aria2/aria2.session
save-session-interval=60
EOF
cat > /etc/systemd/system/aria2c.service <<EOF
[Unit]
Description=Aria2 Downloader
After=network.target

[Service]
Type=forking
ExecStart=/usr/bin/aria2c --conf-path=/etc/aria2/aria2.conf -D
ExecReload=/bin/kill -HUP \$MAINPID
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl enable aria2c
systemctl start aria2c