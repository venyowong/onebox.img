私有云
=====

视频介绍
-------

<a href="https://www.bilibili.com/video/BV1tzMh6xEq3" target="_blank" rel="noopener noreferrer">
  <img src="../images/私有云功能介绍封面.webp" alt="私有云完整功能介绍" style="width:100%; max-width:640px; display:block; border-radius:8px;">
  <div style="margin-top:6px; color:#1e88e5; font-weight:bold; font-size:16px;">
    ▶ 点击图片跳转B站观看完整功能介绍
  </div>
</a>

创建云目录
--------

<img src="../images/创建云目录.png" style="max-width: 640px; width: 100%;">

添加用户
------

<img src="../images/添加用户.png" style="max-width: 640px; width: 100%;">

用户授权
-------

<img src="../images/用户授权.png" style="max-width: 640px; width: 100%;">

pc 通过 smb 协议连接 1Box
------------------------

关于不同操作系统的 pc 如何通过 smb 协议连接网络文件服务器，网上有大量的教程，开头的视频里面也有演示，在此不多赘述

使用 1Box + Joplin 实现私有云笔记功能
----------------------------------

私有云笔记功能的使用场景应该不太可能只局限于家里，所以需要先从配置内网穿透开始，请参考 [EasyTier](advanced.md) 先完成异地组网的配置

下载完 Joplin 之后，按照以下截图进行配置

<img src="../images/joplin 配置.jpg" style="max-width: 640px; width: 100%;">

1. 同步目标选择 WebDAV
2. URL 按照 `{域名}/cloud/dav/{目录}` 的格式进行填写，域名是 EasyTier 自动为 1Box 设备分配的 IP，目录就是您刚刚创建的云目录
3. 用户名/密码就是您授权给该云目录的用户的账号密码

若有疑问或遇到问题，可以参考上面的视频，或者网上搜索一下教程，但是 URL 必须按照以上说明的进行配置

手机文件同步
----------

目前暂未发现有比较好用的手机端文件同步工具，上面的视频中演示了 FolderSync，但是后来在 1Box 的迭代过程中加入了文件整理功能，发现文件更换了位置后，FolderSync 会再次发起同步，会导致文件重复，因此不推荐使用 FolderSync

目前比较可行的方案是使用手机系统自带的文件管理工具，手动选择需要同步到云端的文件(若文件较多，可先压缩再同步)，同步到云端使用 1Box 自动整理文件，下次同步文件时，只需要增量同步即可