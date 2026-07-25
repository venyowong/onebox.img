# onebox.img

本仓库本来是打算用于存储 1Box 打包出来的系统镜像包，但是考虑到不同开发板的兼容性问题，最终还是决定只提供程序版本包于安装部署步骤

## 下载程序包

[Releases](https://github.com/venyowong/onebox.img/releases)

## 环境要求

1. [OpenWRT](https://openwrt.org/)
2. [aria2](https://github.com/aria2/aria2)
3. [Jellyfin](https://github.com/jellyfin/jellyfin)(非必选)

## 安装部署

1. **重要提示：** 1Box 项目开发时默认监听 80 端口，把 uhttpd 端口号修改为 81，并使用 mDNS 绑定了 onebox.local 域名
2. 修改 uhttpd 端口
    ```
    uci -q delete uhttpd.main.listen_http
    uci -q delete uhttpd.main.listen_https
    uci add_list uhttpd.main.listen_http="0.0.0.0:81"
    uci add_list uhttpd.main.listen_http="[::]:81"
    uci commit uhttpd
    /etc/init.d/uhttpd restart
    ```
3. 安装 rpcd-mod-file
    ```
    opkg update && opkg install rpcd-mod-file
    /etc/init.d/rpcd restart
    ```
4. 使用 mDNS 绑定 onebox.local 域名

    - vi /etc/avahi/avahi-daemon.conf

        ```
        [server]
        host-name=onebox
        domain-name=local
        ```
    - /etc/init.d/avahi-daemon restart
5. 将程序包解压到 /opt/onebox
6. cd /opt/onebox
7. ./install.sh
8. 连接、挂载移动硬盘到 /cloud
9.  设置硬盘休眠，建议设置在 1 天以上，避免夜间休息时，硬盘自动休眠了
10. 访问 [1Box 初始化文档](http://onebox.local/#/other/docs)

## 1Box 服务使用说明

[目录](./docs/navigation.md)