# onebox.img
该仓库主要用于存储 1Box 项目打包的系统镜像及其使用说明

## 下载镜像

[Releases](./releases)

刷镜像时，请先解压出 .img 文件再烧录

## 使用镜像安装 1Box

1. 启动后等待一分钟
2. 打开 [iStoreOS 终端](http://onebox.local:81/cgi-bin/luci/admin/services/ttyd)
3. 账号：root 初始密码：password
4. 系统盘扩容

    系统镜像默认只有一个小分区，需要把剩余的磁盘空间合并到系统分区（overlay），否则空间不够安装和运行 1Box
    ```
    # 查看当前分区布局
    fdisk -l /dev/mmcblk0

    如果只有三个分区，并且第三个分区占满剩余系统盘空间，则跳到下一步
    
    找到第四个分区（`/dev/mmcblk0p4`），它占用了大部分空闲空间。执行以下步骤将其删除，空间合并到第三个分区：
    
    # 1. 删除第四个分区
    fdisk /dev/mmcblk0
    
    进入 fdisk 交互界面后依次输入：
    d      ← 删除分区
    4      ← 选择第四个分区
    w      ← 写入并退出
    
    # 2. 把第三个分区扩展到磁盘末尾
    parted /dev/mmcblk0 resizepart 3 100%
    
    # 3. 扩容文件系统
    resize2fs /dev/mmcblk0p3
    
    # 4. 重启
    reboot
    
    重启后确认 overlay 大小：
    df -h /overlay
    ```
5. 进入 1Box 预装程序目录：cd /opt/onebox
6. ./install.sh
7. 连接硬盘
8. 访问 [1Box 初始化文档](http://onebox.local/#/other/docs)

## 1Box 服务使用说明

[目录](./docs/navigation.md)