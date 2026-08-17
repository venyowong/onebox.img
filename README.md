# onebox.img

本仓库本来是打算用于存储 1Box 打包出来的系统镜像包，但是考虑到不同开发板的兼容性问题，最终还是决定只提供程序版本包于安装部署步骤

## 下载程序包

[Releases](https://github.com/venyowong/onebox.img/releases)

## 系统支持

- [ImmortalWRT](./ImmortalWRT.md)
- [Armbian](./Armbian.md)

## 1Box 服务使用说明

[目录](./docs/navigation.md)

## 其他备注

1. [ffmpeg](https://github.com/FFmpeg/FFmpeg)
    - ffmpeg 在 1Box 项目中主要的作用是合并 ts 文件
    - 程序会优先使用 `./ffmpeg`
    - 如果当前目录不存在 ffmpeg，则使用 `ffmpeg`
    - 如果没安装 ffmpeg，则会直接将 ts 文件拼接起来
2. [neatcli](https://github.com/fognil/neatcli)
    
    1Box 使用 neatcli 实现文件自动整理功能，为了 1Box 项目的需要，我对 neatcli 进行了一定的修改(详情请看我的 [fork](https://github.com/venyowong/neatcli))，请从 [Releases](https://github.com/venyowong/onebox.img/releases) 下载 neatcli 程序，上传至 /opt/onebox 目录，才可以正常使用文件整理功能
3. OpenClash(非必选)：`apk add uci-app-openclash`