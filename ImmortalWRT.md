## ImmortalWRT

本项目在 Radxa E20C 使用 ImmortalWRT 验证过，以下介绍完整安装过程

1. 设置网络
  ```
  uci set network.lan.proto=dhcp
  uci commit network
  /etc/init.d/network restart
  ```
1. [系统盘扩容](https://openwrt.org/docs/guide-user/advanced/expand_root)
2. 执行 [init_openwrt.sh](./init_openwrt.sh)
3. avahi
    - vi /etc/avahi/avahi-daemon.conf

        ```
        [server]
        host-name=onebox
        domain-name=local
        ```
    - /etc/init.d/dbus restart
    - /etc/init.d/avahi-daemon restart
4. 连接、挂载移动硬盘到 /cloud
   - 打开 [挂载点](http://onebox.local:81/cgi-bin/luci/admin/system/mounts)
   - 卸载 已挂载的文件系统 中自动挂载的移动硬盘分区
   - 在 挂载点 中，将移动硬盘分区挂载为 /cloud
   - 保存并应用
5.  设置硬盘休眠，建议设置在 1 天以上，避免夜间休息时，硬盘自动休眠了
   - apk add luci-app-hd-idle
   - 访问 [硬盘休眠](http://onebox.local:81/cgi-bin/luci/admin/nas/hd_idle)
   - 设置休眠时间
   - 保存并应用
6. 配置 [aria2](http://192.168.1.56:81/cgi-bin/luci/admin/nas/aria2)，将下载目录修改为 /cloud/download
7. 将 [程序包](https://github.com/venyowong/onebox.img/releases) 解压到 /opt/onebox
8. cd /opt/onebox
9. ./install.sh
10. 访问 [1Box 初始化文档](http://onebox.local/#/other/docs)