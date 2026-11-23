# noop

[Noop](https://huacnlee.github.io/noop/) 的主机端：一支跑在你自己机器上的 Claude Code 和 Codex 小队。

上游把这件事分成两个安装脚本，这个包对应其中的服务端（`install.sh`），桌面客户端是另一个包
[`noop-bin`](https://aur.archlinux.org/packages/noop-bin)（对应 `install-client.sh`）。

## 装完之后

```bash
# 第一台机器：部署属于你的 Cloudflare Worker，作为小队的据点
noop init --primary

# 其他机器：加入已有的据点
noop init <noop-url>

# 让它常驻（systemd 用户服务）
noop install

# 看看现在的状态
noop status
```

装好以后，这个包提供两个命令：`noop` 和 `hub`（旧名，指向同一个程序）。

## 和上游安装脚本的差别

上游的 `install.sh` 把代码 clone 到 `~/.noop/app` 再用 bun 跑；这个包把代码装在
`/usr/lib/noop`，用 pacman 更新，命令直接指向它。两边做的事一样：数据都在 `~/.noop`，
服务都是 systemd 用户服务。

两点差别值得知道：

- 上游的 `noop update` 是 git 自己更新代码；这个包由 pacman 更新，`noop update` 不会有动作。
- 客户端 `noop-bin` 不会跟着这个包走：它是独立的图形程序，单独更新。

## 依赖

`bun` 是必需的（Arch 官方仓库里就有）。`claude-code`、`codex`、`github-cli`、`git` 是可选项，
装上之后小队才能真正干活——上游的 `noop doctor` 会告诉你缺了什么。
