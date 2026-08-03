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
2. [Jellyfin](https://github.com/jellyfin/jellyfin)(非必选)

    Jellyfin 是一款优秀的开源媒体服务器，配合 1Box 使用可以打造美观的海报墙、记录观看进度，获得更好的影音播放体验。详细配置说明请参考 [媒体库功能文档](./docs/flixhub.md#使用-jellyfin-接管视频资源)。

    ### 方式一：使用 docker-compose（推荐）

    项目根目录已提供 [docker-compose.yml](./docker-compose.yml)，首次启动会自动拉取镜像，后续会跳过 pull 直接使用本地镜像：

    ```bash
    # 安装 Docker（如未安装）
    apk update
    apk add luci-app-docker
    apk add luci-app-dockerman

    # 创建配置和缓存目录
    mkdir -p /cloud/Configs/Jellyfin
    mkdir -p /cloud/Caches/Jellyfin

    # 启动 Jellyfin
    docker compose up -d
    ```

    > **镜像代理**：默认使用 Daocloud 代理镜像，如果你使用其他代理，请修改 `docker-compose.yml` 中的 `image` 为你的代理地址。

    ### 方式二：使用 docker run

    ```bash
    apk update
    apk add luci-app-docker
    apk add luci-app-dockerman

    mkdir -p /cloud/Configs/Jellyfin
    mkdir -p /cloud/Caches/Jellyfin

    # 国内用户请使用代理镜像，可根据实际情况替换为其他代理地址
    docker pull m.daocloud.io/docker.io/jellyfin/jellyfin:latest

    docker run -d \
      --name jellyfin \
      --network host \
      -e PUID=0 \
      -e PGID=0 \
      -e TZ=Asia/Shanghai \
      -e JELLYFIN_PublishedServerUrl=http://onebox.local:8096 \
      -v /cloud/Configs/Jellyfin:/config \
      -v /cloud/Caches/Jellyfin:/cache \
      -v /cloud:/media \
      --restart unless-stopped \
      m.daocloud.io/docker.io/jellyfin/jellyfin:latest
    ```

    启动后访问 [http://onebox.local:8096](http://onebox.local:8096) 即可进入 Jellyfin 初始化向导。
3. OpenClash(非必选)：`apk add uci-app-openclash`