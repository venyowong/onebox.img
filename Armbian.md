## Armbian

本项目在 OrangePi Zero 3 使用 Armbian 验证过

1. [init_armbian.sh](./init_armbian.sh)
2. avahi
   - vi /etc/avahi/avahi-daemon.conf
    ```
    [server]
    host-name=onebox
    domain-name=local
    ```
   - sudo systemctl restart dbus
   - sudo systemctl restart avahi-daemon
3. 连接、挂载移动硬盘到 /cloud
   - sudo mkdir /cloud
   - sudo mount /dev/sda1 /cloud
4. 
5. 将 [程序包](https://github.com/venyowong/onebox.img/releases) 解压到 /opt/onebox
6. cd /opt/onebox
7. ./install.sh
8.  访问 [1Box 初始化文档](http://onebox.local/#/other/docs)