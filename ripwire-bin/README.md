# ripwire-bin

The ripgrep of AI context: a zero-dependency C++23 CLI + MCP server giving coding agents a ranked, deterministic map of any repo, blast radius, tests-to-run and quality deltas. Signatures at 80% fewer bytes than bodies; ~5% of a grep-and-read pass's tokens.

[上游主页](https://github.com/redhat-et/ripwire) · [AUR](https://aur.archlinux.org/packages/ripwire-bin)

使用上游预编译 tar.gz，支持 `x86_64`（linux-x64）和 `aarch64`（linux-arm64），初始版本 `0.5.0`。

```sh
yay -S ripwire-bin
ripwire --version
ripwire /path/to/repo
```

## 依赖和附带资源

两个架构的 ELF 均动态链接 glibc、GCC 与 C++ 运行库，因此声明 `glibc`、`libgcc`、`libstdc++`；附带脚本需要 `bash`。`git` 用于远程仓库和 Git 历史功能，`jq` 用于可选 hook 集成，均列为可选依赖。

上游 skills 和 hooks 安装在 `/usr/share/ripwire/`，不会自动修改用户的 agent 配置。需要时可自行运行上游安装脚本，例如：

```sh
bash /usr/share/ripwire/skills/install.sh --codex
```

添加 `--hook` 可同时注册 hooks，需要先安装 `jq`。上游 README 位于 `/usr/share/doc/ripwire-bin/README.md`。

## 自动更新

[GitHub Actions](https://github.com/tinypkg/aur/actions/workflows/update-ripwire-bin.yml) 每 12 小时跟踪 GitHub 最新 Release，支持手动 `version` 和 `force`。发布前下载两个架构，验证目录结构与 ELF 架构，并运行 x64 二进制核对版本；ARM64 不在 x64 runner 上执行。

自动更新拒绝降级；首次发布保留 `pkgrel=1`，已发布同版本强制更新递增 `pkgrel`。使用现有 `AUR_USERNAME`、`AUR_EMAIL`、`AUR_SSH_PRIVATE_KEY` Secrets，AUR 成功后才提交 GitHub 版本状态。

GitHub PKGBUILD 保留 `SKIP`，deploy action 通过 `updpkgsums` 为两个架构生成真实 SHA-256，并在 AUR 生成 `.SRCINFO`。
