# herdr-app

Herdr 桌面应用：让终端与编码代理持续运行的本地工作台。

[上游主页](https://herdr.dev) · [源码](https://github.com/herdrdev/herdr-app) · [AUR](https://aur.archlinux.org/packages/herdr-app)

使用上游 `releases.herdr.dev` 的官方预编译包，支持 `x86_64` 与 `aarch64`。

```sh
yay -S herdr-app
herdr-app
```

## 这个包提供什么

| 路径 | 说明 |
|---|---|
| `/usr/bin/herdr-app` | 上游二进制 |
| `/usr/share/applications/herdr-app.desktop` | 桌面启动项（`Categories=Development`） |
| `/usr/share/icons/hicolor/scalable/apps/herdr-app.svg` | 图标 |
| `/usr/share/licenses/herdr-app/LICENSE` | 同版本 Apache-2.0 LICENSE |
| `/usr/share/licenses/herdr-app/THIRD-PARTY-NOTICES` | 上游第三方组件声明 |

上游的 `install.sh` 会把整个 bundle 装进 `~/.local/share/herdr-app` 并软链到 `~/.local/bin`；装成包之后走标准 FHS 路径，由 pacman 管理。

## 与 herdr-app-bin 的关系

本包与 [herdr-app-bin](https://aur.archlinux.org/packages/herdr-app-bin) 安装**完全相同的文件**，因此互斥：

```sh
provides=('herdr-app')
conflicts=('herdr-app-bin')
```

两者装任意一个即可。

## 配套的后台服务

应用首次启动时会提示获取 herdr-core。也可以用包管理器先装好，避免它自行下载到用户目录：

```sh
yay -S hc-bin   # herdr-core（hc）
```

`hc-bin` 是本仓库提供的 [herdr-core](https://aur.archlinux.org/packages/hc-bin) 包，与本包配套使用。

## 版本来源

上游没有 GitHub Release，版本契约来自 `https://releases.herdr.dev/app/latest.json` 的 `version` 字段；下载 URL 是版本化的（`/app/<version>/herdr-app-linux-<arch>.tar.gz`），不是 mutable latest。

manifest 里还有 `core_min`（本 app 要求的最低 herdr-core 版本），本包未把它写成硬依赖，以免在 hc-bin 暂时落后时阻塞安装；需要时可参考该字段决定是否先升级 `hc-bin`。

`.github/workflows/update-herdr-app.yml` 每 12 小时检查一次，并同时校验：

1. `latest.json`（或指定版本 `<version>/manifest.json`）里两个 Linux 架构都有可用的 `url` 与 64 位十六进制 `sha256`；
2. 实际下载两个架构的 tarball，逐个比对 manifest 里的 sha256；
3. tarball 内确实含 `herdr-app/herdr-app`。

checksum 归属：GitHub 侧 PKGBUILD 保持 `SKIP`，AUR 侧由 `updpkgsums` 写入真实值。

## 手动触发

```sh
gh workflow run update-herdr-app.yml --ref main
gh workflow run update-herdr-app.yml --ref main -f version=0.1.8
gh workflow run update-herdr-app.yml --ref main -f force=true
```
