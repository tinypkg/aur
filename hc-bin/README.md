# hc-bin

herdr-core（命令名 `hc`）：保持 Herdr 终端与编码代理持续运行的后台服务。

[上游主页](https://herdr.dev/core/) · [源码](https://github.com/herdrdev/herdr-core) · [AUR](https://aur.archlinux.org/packages/hc-bin)

使用上游 `releases.herdr.dev` 的官方预编译包，静态链接（无运行时动态依赖），支持 `x86_64` 与 `aarch64`。

```sh
yay -S hc-bin
hc --version
```

## 这个包提供什么

| 路径 | 说明 |
|---|---|
| `/usr/bin/herdr-core` | 上游二进制 |
| `/usr/bin/hc` | 指向 `herdr-core` 的符号链接（上游安装脚本同样会建这个别名） |
| `/usr/share/licenses/hc-bin/LICENSE` | 同版本 tag 的 Apache-2.0 LICENSE |

上游的 `install.sh` 会装到 `~/.local/bin` 并**仅在系统里没有 `hc` 时**才创建别名；装成包之后由 pacman 管理，这两个文件都归包所有。

## 与 herdr-core-bin 的关系

本包与 [herdr-core-bin](https://aur.archlinux.org/packages/herdr-core-bin) 安装**完全相同的文件**，因此互斥：

```sh
conflicts=('herdr-core-bin' 'herdr-core')
provides=('herdr-core')
```

两者装任意一个即可，不要同时装。本包与主程序 [herdr-bin](https://aur.archlinux.org/packages/herdr-bin) 是配套组件，可以共存。

## 版本来源

上游没有 GitHub Release，版本契约来自 `https://releases.herdr.dev/core/latest.json` 的 `version` 字段；下载 URL 是版本化的（`/core/<version>/herdr-core-linux-<arch>.tar.gz`），不是 mutable latest。

`.github/workflows/update-hc-bin.yml` 每 12 小时检查一次，并同时校验：

1. `latest.json`（或指定版本 `<version>/manifest.json`）里两个 Linux 架构都有可用的 `url` 与 64 位十六进制 `sha256`；
2. 实际下载两个架构的 tarball，逐个比对 manifest 里的 sha256；
3. tarball 根目录确实含 `herdr-core`。

checksum 归属：GitHub 侧 PKGBUILD 保持 `SKIP`，AUR 侧由 `updpkgsums` 写入真实值。

## 手动触发

```sh
# 检测最新版本
gh workflow run update-hc-bin.yml --ref main

# 校验指定版本（不会伪造新版本）
gh workflow run update-hc-bin.yml --ref main -f version=0.1.14

# 强制重新校验并 bump pkgrel
gh workflow run update-hc-bin.yml --ref main -f force=true
```
