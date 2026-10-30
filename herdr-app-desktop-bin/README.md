# herdr-app-desktop-bin

Herdr 桌面应用：让终端与编码代理持续运行的本地工作台。

[上游主页](https://herdr.dev) · [源码](https://github.com/herdrdev/herdr-app) · [AUR](https://aur.archlinux.org/packages/herdr-app-desktop-bin)

使用上游 `releases.herdr.dev` 的官方预编译包，支持 `x86_64` 与 `aarch64`。

```sh
yay -S herdr-app-desktop-bin
herdr-app
```

## 这个包提供什么

| 路径 | 说明 |
|---|---|
| `/usr/bin/herdr-app` | 上游二进制（命令名仍是 `herdr-app`） |
| `/usr/share/applications/herdr-app.desktop` | 桌面启动项（`Categories=Development`） |
| `/usr/share/icons/hicolor/scalable/apps/herdr-app.svg` | 图标 |
| `/usr/share/licenses/herdr-app-desktop-bin/LICENSE` | 同版本 Apache-2.0 LICENSE |
| `/usr/share/licenses/herdr-app-desktop-bin/THIRD-PARTY-NOTICES` | 上游第三方组件声明 |

上游的 `install.sh` 会把整个 bundle 装进 `~/.local/share/herdr-app` 并软链到 `~/.local/bin`；装成包之后走标准 FHS 路径，由 pacman 管理。

## 与 herdr-app-bin 的关系

本包与 [herdr-app-bin](https://aur.archlinux.org/packages/herdr-app-bin) 安装**完全相同的文件**，因此互斥：

```sh
provides=('herdr-app')
conflicts=('herdr-app-bin' 'herdr-app')
```

两者装任意一个即可。

## 依赖说明

这是动态链接的 wgpu（Rust 图形栈）应用。`ldd` 只能看到直接的 ELF 依赖，图形后端是运行时 `dlopen` 的，因此显式声明了：

| 依赖 | 用途 |
|---|---|
| `vulkan-icd-loader` | 运行时 dlopen `libvulkan.so.1` |
| `libglvnd` | 运行时 dlopen `libEGL.so.1` |
| `wayland` | 运行时 dlopen `libwayland-client.so.0` / `libwayland-egl.so.1` |
| `libxcb` / `libxkbcommon` / `libxkbcommon-x11` | 直接 ELF 依赖（X11 后端） |
| `hicolor-icon-theme` | 图标主题目录 |

`namcap` 会把 `libglvnd` / `vulkan-icd-loader` / `wayland` 报成 "may not be needed"，那是误报——它不分析 `dlopen`。

实际还需要一个 Vulkan 驱动才能渲染，由显卡驱动包提供（如 `mesa` / `nvidia-utils`），本包不硬性绑定。

## 配套的后台服务

应用首次启动时会提示获取 herdr-core。也可以用包管理器先装好，避免它自行下载到用户目录：

```sh
yay -S hc-bin   # herdr-core（hc）
```

## 版本来源

上游没有 GitHub Release，版本契约来自 `https://releases.herdr.dev/app/latest.json` 的 `version` 字段；下载 URL 是版本化的（`/app/<version>/herdr-app-linux-<arch>.tar.gz`），不是 mutable latest。

manifest 里还有 `core_min`（本 app 要求的最低 herdr-core 版本），本包未把它写成硬依赖，以免在 hc-bin 暂时落后时阻塞安装。

`.github/workflows/update-herdr-app-desktop-bin.yml` 每 12 小时检查一次，并同时校验：

1. `latest.json`（或指定版本 `<version>/manifest.json`）里两个 Linux 架构都有可用的 `url` 与 64 位十六进制 `sha256`；
2. 实际下载两个架构的 tarball，逐个比对 manifest 里的 sha256；
3. tarball 内确实含 `herdr-app/herdr-app`。

checksum 归属：GitHub 侧 PKGBUILD 保持 `SKIP`，AUR 侧由 `updpkgsums` 写入真实值。

## 手动触发

```sh
gh workflow run update-herdr-app-desktop-bin.yml --ref main
gh workflow run update-herdr-app-desktop-bin.yml --ref main -f version=0.1.8
gh workflow run update-herdr-app-desktop-bin.yml --ref main -f force=true
```
