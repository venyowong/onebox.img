# onebox.img

本仓库本来是打算用于存储 1Box 打包出来的系统镜像包，但是考虑到不同开发板的兼容性问题，最终还是决定只提供程序版本包于安装部署步骤

## 下载程序包

[Releases](https://github.com/venyowong/onebox.img/releases)

## 环境要求

1. [OpenWRT](https://openwrt.org/)
2. [Jellyfin](https://github.com/jellyfin/jellyfin)(非必选)
    ```
    mkdir /cloud/Configs/Jellyfin
    mkdir /cloud/Caches/Jellyfin
    bind:/cloud:/media
    bind:/cloud/Configs/Jellyfin:/config
    bind:/cloud/Caches/Jellyfin:/cache
    ```

## 安装部署

1. **重要提示：** 1Box 项目开发时默认监听 80 端口，把 uhttpd 端口号修改为 81，并使用 mDNS 绑定了 onebox.local 域名
2. 执行 [init_onebox.sh](./init_onebox.sh)
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
7. 将程序包解压到 /opt/onebox
8. cd /opt/onebox
9. ./install.sh
10. 访问 [1Box 初始化文档](http://onebox.local/#/other/docs)

## 1Box 服务使用说明

[目录](./docs/navigation.md)