# onebox.img
该仓库主要用于存储 1Box 项目打包的系统镜像及其使用说明

## 下载镜像

[Releases](./releases)

## 使用镜像安装 1Box

1. 启动后等待一分钟
2. 系统盘扩容
   
   如果您是使用压缩后的系统镜像进行刷机，那么系统盘空间会相对有限，因此需要进行扩容。请参考[教程](https://docs.radxa.com/e/e20c/getting-started/quick-start#istoreos-%E6%89%A9%E5%AE%B9)
   
   建议将系统剩余的磁盘空间挂载为 /onebox

3. 打开 [iStoreOS 终端](http://onebox.local:81/cgi-bin/luci/admin/services/ttyd)
4. 账号：root
5. 进入 1Box 预装程序目录：cd /opt/onebox
6. ./install.sh {扩容后的系统分区路径：如 /onebox}
7. 连接移动硬盘
8. 访问 [1Box 初始化文档](http://onebox.local/#/other/docs)，进行初始化配置

## 1Box 服务使用说明

[目录](./docs/navigation.md)