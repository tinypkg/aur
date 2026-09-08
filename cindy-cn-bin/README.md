# cindy-cn-bin

Consider it done. The open-source AI agent that works out of the box · 想到，就能做到。开源、开箱即用的 AI Agent。

[上游主页](https://github.com/makecindy/cindy) · [AUR](https://aur.archlinux.org/packages/cindy-cn-bin)

此包使用上游 **国内版（cn）** Linux x64 deb，初始版本为 `0.1.73`，仅支持 `x86_64`。

```sh
yay -S cindy-cn-bin
```

安装后从应用菜单打开 Cindy，或运行 `cindy`。两个版本使用相同的命令、桌面入口和安装路径，因此 `cindy-cn-bin` 与 `cindy-bin` 互斥；切换版本时由包管理器替换。

## 自动更新

[GitHub Actions](https://github.com/tinypkg/aur/actions/workflows/update-cindy-cn-bin.yml) 每 12 小时检查 `makecindy/cindy` 的最新 GitHub Release。发布前验证资产名称、deb 内版本和 amd64 架构，并拒绝降级。

支持手动输入 `version`（可带 `v` 前缀）及 `force`。首次发布保留真实版本和 `pkgrel=1`；已发布版本使用 `force` 时递增 `pkgrel`。

workflow 使用仓库或组织提供的 `AUR_USERNAME`、`AUR_EMAIL`、`AUR_SSH_PRIVATE_KEY` Secrets。GitHub 的 PKGBUILD 保留 `SKIP`，AUR 发布时通过 `updpkgsums` 生成真实 SHA-256 和 `.SRCINFO`；发布成功后才提交 GitHub 版本状态。

保留上游自带 Electron，配置 Chromium sandbox 权限，不添加 `--no-sandbox`。打包验证不包含登录和 AI 服务可用性测试。

## 依赖核对

0.1.73 已核对 deb control、21 个 ELF 文件及 Node 原生模块的动态库依赖，并使用 namcap 检查构建产物。`libgcc`、`libstdc++` 分别提供 GCC 与 C++ 运行库，`mesa` 提供 `libgbm.so.1`；保留上游声明的 `libdrm`、`libnotify` 和 `xdg-utils` 运行依赖。FFmpeg、libvips 和 Electron 已随包提供。

移除 node-pty 夹带的 Windows 开发目录，避免引入无用的 Python 依赖。namcap 对远程部署 `.mjs` 脚本的 Node shebang、上游二进制加固和 sandbox setuid 仍会提示；本地工作进程使用 Electron utility process，远端 Node 由应用的远程部署流程管理。
