初始化 1Box 设备
==============

查看 1Box IP
-----------

1Box 支持 mDNS，可以免 IP 直接访问，但是有可能部分无法识别 mDNS 的场景，您可以在手机上访问 `http://onebox.local`，然后打开最下面的 "其他" -> "iStoreOS" 右侧查看 IP

<img src="../images/查看ip.png" style="max-width: 640px; width: 100%;">

更新 1Box 服务
------------

系统安装好后，第一时间请检查 1Box 服务是否有新版本，如果有请先更新到最新版

<img src="../images/版本更新.png" style="max-width: 640px; width: 100%;">

有 ⏫ 图标就代表有新版本，点击图标可下载安装包，下载后点击版本号，选择下载好的文件，上传之后，1Box 将会自动更新版本

修改管理员密码
------------

1Box 和 iStoreOS 的默认密码都是 `password`，请第一时间重置密码([1Box 重置密码](http://onebox.local/#/admin/settings)、[iStoreOS 重置密码](http://onebox.local:81/))，两个系统密码必须保持一致！！！

1Box 在内网环境大多数服务都是不需要登录的，但是修改系统设置时，1Box 将会要求使用管理员密码登录后才可以操作

由于考虑到用户可能使用内网穿透把服务暴露到外网，1Box 要求外网环境需要先使用管理员密码登录。但这是建立在用户正确暴露服务的情况下，如果有内网穿透需求，请一定要把外网请求转发到 `127.0.0.1` 上，千万不要使用家庭局域网网段，否则 1Box 将无法区分出请求是否来自于外网

假设，1Box 在您家庭网络中的 IP 是 `192.168.1.100`，您使用 DDNSTO 服务暴露到外网，并且配置的内网地址就是 `192.168.1.100`，那外网请求就可以免登录访问 1Box 服务。虽然 DDNSTO 有设备白名单功能，但是为了确保用户的安全，1Box 并不会完全把安全校验交给其他环节来实现。因此，为了数据安全，内网穿透功能一定要把外网请求转发到 `127.0.0.1` 上

挂载移动硬盘
-----------

目前 1Box 只支持一个移动硬盘，且默认路径为 /cloud，但 iStoreOS 无法自动将移动硬盘挂载到指定目录，因此需要用户在 iStoreOS 中手动挂载移动硬盘

- 请先打开 [【iStoreOS】如何正确挂载硬盘](https://www.koolcenter.com/t/topic/641) 熟悉挂载方法
- 打开 [iStoreOS](http://onebox.local:81) 开始挂载
- 若挂载失败，可能是磁盘数据格式损坏。若数据可再生，请考虑格式化后重新挂载，磁盘格式建议选择 ext4；若数据重要且不可再生，切勿格式化，请寻求专业人士帮助

修改 docker 配置
---------------

为了防止系统盘空间太小，导致 Docker 无法启动，需要在 iStoreOS 首页使用 Docker 迁移功能，将根目录迁移至 /cloud/docker

此步骤一定要在安装 Docker 镜像之前执行，否则容易导致 Docker 无法正常工作

安装 Jellyfin
------------

1Box 预配置的系统镜像无法更改 Docker 环境，因此使用 Docker 容器实现的服务都需要用户自行配置

打开 [Jellyfin 服务页面](http://onebox.local:81/cgi-bin/luci/admin/services/jellyfin) 按照以下配置进行修改，最后点击安装即可
- 镜像：默认
- 宿主网络：勾选✅
- 端口：默认 8096
- 配置文件路径：/cloud/Configs/Jellyfin
- 媒体路径：/cloud
- 转码缓存路径：/cloud/Caches/Jellyfin