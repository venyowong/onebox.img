# onebox.img
该仓库主要用于存储 1Box 项目打包的系统镜像及其使用说明

## 下载镜像

[Releases](https://github.com/venyowong/onebox.img/releases)

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
8. 挂载移动硬盘

    目前 1Box 只支持一个移动硬盘，且默认路径为 /cloud，但 iStoreOS 无法自动将移动硬盘挂载到指定目录，因此需要用户在 iStoreOS 中手动挂载移动硬盘

    - 请先打开 [【iStoreOS】如何正确挂载硬盘](https://www.koolcenter.com/t/topic/641) 熟悉挂载方法
    - 打开 [iStoreOS](http://onebox.local:81) 开始挂载
    - 若挂载失败，可能是磁盘数据格式损坏。若数据可再生，请考虑格式化后重新挂载，磁盘格式建议选择 ext4；若数据重要且不可再生，切勿格式化，请寻求专业人士帮助
9. 由于 1Box 依赖移动硬盘，为了避免在硬盘未挂载前 1Box 就写入数据，请将上一步挂载的硬盘配置 [挂载前等待磁盘](http://onebox.local:81/cgi-bin/luci/admin/system/tuning/boot)
10. 设置 [硬盘休眠](http://onebox.local:81/cgi-bin/luci/admin/services/hd_idle)，建议设置在 1 天以上，避免夜间休息时，硬盘自动休眠了
11. 访问 [1Box 初始化文档](http://onebox.local/#/other/docs)

## 1Box 服务使用说明

[目录](./docs/navigation.md)