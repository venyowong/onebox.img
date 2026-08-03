进阶
====

EasyTier
--------

1. 安装依赖
   ```
   apk update
   apk add kmod-tun
   apk add luci-compat
   ```
2. 下载[安装包](https://github.com/EasyTier/luci-app-easytier/releases)
3. 上传 zip 压缩包
4. unzip EasyTier-*.zip
5. apk add --allow-untrusted /tmp/luci-app-easytier_*.apk
6. 刷新浏览器或重新登录LuCI界面
7. 启动 EasyTier Core，不需要启动 EasyTier Web
8. 配置 EasyTier Core
   - 填写网络名称
   - 填写 Network Secret(相当于密码)
   - 勾选 Enable DHCP
   - Peer Nodes 添加一个 [公共共享节点](https://astral.fan/server-config/server-list/)
   - 保存并应用
9. 下载 [EasyTier 客户端](https://www.easytier.cn/guide/download.html)
10. 根据 [官方教程](https://www.easytier.cn/guide/gui/basic.html) 快速组网
11. 成功组网后，就可以在外网使用类似于 `10.126.126.2` 这样的 IP 访问 1Box 服务了

### 非 OpenWrt 系统

以上步骤依赖 OpenWrt 的 LuCI 插件（luci-app-easytier），普通 Linux（如 Debian/Ubuntu 等 systemd 系统）没有该界面，请改用命令行方式：

1. 安装（任选一种）
   - 一键安装脚本（推荐，自动注册为 systemd 服务，依赖 `unzip`）
     ```
     sudo apt install -y unzip
     wget -O /tmp/easytier.sh "https://raw.githubusercontent.com/EasyTier/EasyTier/main/script/install.sh" && sudo bash /tmp/easytier.sh install --no-gh-proxy
     ```
     程序安装到 `/opt/easytier`，并注册为服务 `easytier@default`
     > 脚本默认走 `ghfast.top` 加速代理下载，网络不佳时会报 `Connection reset` 下载失败；`--no-gh-proxy` 为直连 GitHub（更稳），若直连缓慢/失败可改用 `--gh-proxy https://gh-proxy.com/` 指定其他加速镜像
   - 或手动下载[命令行程序](https://www.easytier.cn/guide/download.html)，解压后即可使用
2. 直接安装服务并启动（无需手动启动 Core，`--` 后面的参数即启动参数，安装后默认开机自启）
   ```
   sudo /opt/easytier/easytier-cli service install -- -d --network-name 你的网络名称 --network-secret 你的密码 -p tcp://共享节点IP:1010
   sudo /opt/easytier/easytier-cli service start
   ```
   > 参数对应关系：`-d` = 勾选 Enable DHCP（自动分配虚拟 IP）；`--network-name` = 网络名称；`--network-secret` = Network Secret（相当于密码）；`-p tcp://共享节点IP:1010` = Peer Nodes 添加 [公共共享节点](https://astral.fan/server-config/server-list/)，端口请以所选节点为准
   >
   > 若为手动解压安装，请进入解压目录后执行 `sudo ./easytier-cli service install ...`；若已用一键脚本安装（自带 `easytier@default` 服务），直接修改 `/opt/easytier/config/default.conf` 后执行 `sudo systemctl restart easytier@default` 即可
3. 下载 [EasyTier 客户端](https://www.easytier.cn/guide/download.html)，根据 [官方教程](https://www.easytier.cn/guide/gui/basic.html)，使用与上面相同的网络名称和密码快速组网
4. 成功组网后，就可以在外网使用类似于 `10.126.126.2` 这样的 IP 访问 1Box 服务了

系统备份
------

1Box 建议您定期使用 OpenWRT 的系统备份功能，将系统的配置以及 1Box 的数据/配置进行备份以便还原

> 说明：以下备份功能依赖 OpenWrt/ImmortalWrt 的 LuCI 界面，仅 OpenWrt 系系统可用；其他系统请直接备份 `/opt/onebox` 目录

打开 [备份与更新](http://onebox.local:81/cgi-bin/luci/admin/system/flash)，在配置标签页添加以下内容：
```
/opt/onebox/config.yaml
/opt/onebox/switch.sh
/opt/onebox/install.sh
/opt/onebox/data
```
点击保存，然后在操作标签页生成备份