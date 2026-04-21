# AUR Packages

自动管理和发布 AUR (Arch User Repository) 软件包的仓库。

## 包含的软件包

- **[karing-bin](https://aur.archlinux.org/packages/karing-bin)** - Simple & Powerful proxy utility
- **[cc-switch-bin](https://aur.archlinux.org/packages/cc-switch-bin)** - Claude Code & Codex 供应商配置管理工具
- **[cc-switch-cli](https://aur.archlinux.org/packages/cc-switch-cli)** - Cross-platform CLI assistant for Claude Code, Codex & Gemini CLI
- **[blink1control2](https://aur.archlinux.org/packages/blink1control2-bin)** - Blink1Control GUI 用于控制 blink(1) USB RGB LED 设备。
- **[confirmo-bin](https://aur.archlinux.org/packages/confirmo-bin)** - Your AI coding companion that lives on your desktop
- **[emdash-app](https://aur.archlinux.org/packages/emdash-app)** - Run multiple coding agents in parallel
- **[autocli-bin](https://aur.archlinux.org/packages/autocli-bin)** - Blazing fast, memory-safe CLI tool for fetching information from websites
- **[docking-bin](https://aur.archlinux.org/packages/docking-bin)** - A lightweight, feature-rich dock for Linux written in Python with GTK 3 and Cairo
- **[herdr-bin](https://aur.archlinux.org/packages/herdr-bin)** - Supervise multiple coding agents in one terminal

## 自动化

本仓库使用 GitHub Actions 自动检测上游版本更新并发布到 AUR：

- ⏰ 每 12 小时自动检查新版本
- 🔄 自动更新 PKGBUILD 文件
- ✅ 自动计算并更新 checksum
- 🚀 自动发布到 AUR

## 手动触发

如果需要手动触发更新，可以在 GitHub Actions 页面选择对应的 workflow 并点击 "Run workflow"，可选择指定版本号或留空自动检测最新版本。

## 配置

需要在 GitHub 仓库中配置以下 Secrets：

- `AUR_USERNAME` - AUR 用户名
- `AUR_EMAIL` - AUR 邮箱
- `AUR_SSH_PRIVATE_KEY` - AUR SSH 私钥

## 维护者

czyt <czytcn@gmail.com>
