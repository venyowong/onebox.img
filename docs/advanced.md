进阶
====

说明
---

1Box 是在市面上常用的开发板基础上进行开发的，交付产品所使用的开发板型号可能会受货源影响而有所不同，但系统都会统一安装 iStoreOS，因此除了 1Box 提供的功能以外，您还可以在 iStoreOS 上安装自己想要的服务或容器

iStoreOS
--------

- <a href="https://site.istoreos.com/" target="_blank">官网</a>
- <a href="https://www.koolcenter.com/" target="_blank">社区</a>
- <a href="https://space.bilibili.com/1492058311" target="_blank">B站</a>

Docker
-------

iStoreOS 系统自带 Docker，并且 1Box 默认会安装 KSpeeder 用于加速镜像的下载。如果您想要安装其他 Docker 服务，推荐您先在 iStore 商店中安装 DPanel，这有助于您更方便地管理 Docker 容器

使用 DDNSTO 服务将 1Box 服务暴露到外网
----------------------------------

DDNSTO 服务并非免费功能，但收费较低，在 iStoreOS 中配置又很快捷方便，因此开发者本人也是使用该服务实现内网穿透的

DDNSTO 的配置只需要根据提示一步步完成即可，但需要注意的是，内网地址一定要使用回环 IP(127.0.0.1)，否则 1Box 会直接在公网上裸奔

<img src="../images/ddnsto%20配置.png" style="max-width: 640px; width: 100%;">

配置 OpenClash
--------------

1Box 的系统镜像默认安装了 [OpenClash](http://onebox.local:81/cgi-bin/luci/admin/services/openclash)，可用于为设备配置科学上网能力，以备不时之需

系统备份
------

1Box 建议您定期使用 iStoreOS 的系统备份功能，将系统的配置以及 1Box 的数据/配置进行备份以便还原

打开 [备份与更新](http://onebox.local:81/cgi-bin/luci/admin/system/flash)，在配置标签页添加以下内容：
```
/onebox/config.yaml
/onebox/switch.sh
/onebox/install.sh
/onebox/data
```
点击保存，然后在操作标签页生成备份