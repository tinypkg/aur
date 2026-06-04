# AUR Packages

自动管理和发布 AUR (Arch User Repository) 软件包的仓库。

## 包含的软件包

- **[karing-bin](https://aur.archlinux.org/packages/karing-bin)** - Simple & Powerful proxy utility ([主页](https://github.com/KaringX/karing))
- **[cc-switch-bin](https://aur.archlinux.org/packages/cc-switch-bin)** - Claude Code & Codex 供应商配置管理工具 ([主页](https://github.com/farion1231/cc-switch))
- **[cc-switch-cli](https://aur.archlinux.org/packages/cc-switch-cli)** - Cross-platform CLI assistant for Claude Code, Codex & Gemini CLI ([主页](https://github.com/SaladDay/cc-switch-cli))
- **[clauge-bin](https://aur.archlinux.org/packages/clauge-bin)** - One window. Every dev tool. ([主页](https://clauge.in))
- **[codiff-bin](https://aur.archlinux.org/packages/codiff-bin)** - A beautiful, minimal, local diff viewer for reviewing staged and unstaged Git changes before committing ([主页](https://github.com/nkzw-tech/codiff))
- **[blink1control2](https://aur.archlinux.org/packages/blink1control2-bin)** - Blink1Control GUI 用于控制 blink(1) USB RGB LED 设备 ([主页](https://github.com/todbot/Blink1Control2))
- **[blink1-tool-bin](https://aur.archlinux.org/packages/blink1-tool-bin)** - Command-line tool for controlling blink(1) USB RGB LED ([主页](https://github.com/todbot/blink1-tool))
- **[blink1-tiny-server-bin](https://aur.archlinux.org/packages/blink1-tiny-server-bin)** - Simple HTTP JSON API server to control blink(1) USB RGB LED ([主页](https://github.com/todbot/blink1-tool))
- **[confirmo-bin](https://aur.archlinux.org/packages/confirmo-bin)** - Your AI coding companion that lives on your desktop ([主页](https://confirmo.love))
- **[cumora-bin](https://aur.archlinux.org/packages/cumora-bin)** - A workspace where AI teammates live, not visit. ([主页](https://cumora.ai))
- **[emdash-app](https://aur.archlinux.org/packages/emdash-app)** - Run multiple coding agents in parallel ([主页](https://github.com/generalaction/emdash))
- **[autocli-bin](https://aur.archlinux.org/packages/autocli-bin)** - Blazing fast, memory-safe CLI tool for fetching information from websites ([主页](https://github.com/nashsu/AutoCLI))
- **[docking-bin](https://aur.archlinux.org/packages/docking-bin)** - A lightweight, feature-rich dock for Linux written in Python with GTK 3 and Cairo ([主页](https://github.com/edumucelli/docking))
- **[dbx-bin](https://aur.archlinux.org/packages/dbx-bin)** - Open-source, lightweight, cross-platform database client (Tauri 2) ([主页](https://github.com/t8y2/dbx))
- **[herdr-bin](https://aur.archlinux.org/packages/herdr-bin)** - Supervise multiple coding agents in one terminal ([主页](https://github.com/ogulcancelik/herdr))
- **[little-snitch-bin](https://aur.archlinux.org/packages/little-snitch-bin)** - Little Snitch informs you whenever a program attempts to establish an outgoing Internet connection ([主页](https://obdev.at/products/littlesnitch))
- **[mise-bin](https://aur.archlinux.org/packages/mise-bin)** - dev tools, env vars, task runner ([主页](https://github.com/jdx/mise))
- **[hclient-cli-bin](https://aur.archlinux.org/packages/hclient-cli-bin)** - 懒猫微服命令行客户端 (Lazycat Microserver CLI client) ([主页](https://lazycat.cloud/download))
- **[openless-bin](https://aur.archlinux.org/packages/openless-bin)** - Hold a key, speak, release — AI-polished text appears at your cursor in any app ([主页](https://github.com/appergb/openless))
- **[revpdf-bin](https://aur.archlinux.org/packages/revpdf-bin)** - The Best Free Offline PDF Editor ([主页](https://github.com/Pawandeep-prog/revpdf-release))
- **[whatcable-cli-bin](https://aur.archlinux.org/packages/whatcable-cli-bin)** - A linux/KDE port of whatcable, a tool to tell you what each USB connected cable can do ([主页](https://github.com/Zetaphor/whatcable-linux))
- **[uniclipboard-bin](https://aur.archlinux.org/packages/uniclipboard-bin)** - Real-time clipboard sync across macOS, Windows and Linux — local-first, peer-to-peer, and end-to-end encrypted ([主页](https://www.uniclipboard.app))
- **[tunnix-bin](https://aur.archlinux.org/packages/tunnix-bin)** - An encrypted SOCKS5/HTTP proxy tunnel over HTTP/SSE ([主页](https://github.com/aeroxy/tunnix))
- **[velotype-bin](https://aur.archlinux.org/packages/velotype-bin)** - Write at the speed of thought - high-performance native Markdown editor built with Rust and GPUI ([主页](https://github.com/manyougz/velotype))
- **[nmem-cli](https://aur.archlinux.org/packages/nmem-cli)** - CLI and TUI for Nowledge Mem - AI memory management ([主页](https://mem.nowledge.co))

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
