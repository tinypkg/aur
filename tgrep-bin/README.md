# tgrep-bin

Trigram-indexed grep with a client/server architecture for fast regex search in large codebases locally.

[上游主页](https://github.com/microsoft/tgrep) · [AUR](https://aur.archlinux.org/packages/tgrep-bin)

使用上游 Linux musl 预编译包，支持 `x86_64` 和 `aarch64`，初始版本 `1.0.4`。

```sh
yay -S tgrep-bin
tgrep --version
tgrep index /path/to/repo
tgrep serve /path/to/repo
```

在另一终端搜索：

```sh
tgrep 'pattern' /path/to/repo
```

不自动启动服务。上游 README 安装在 `/usr/share/doc/tgrep-bin/README.md`，同版本 tag 的 MIT LICENSE 安装在 `/usr/share/licenses/tgrep-bin/LICENSE`。

## 依赖与验证

两个架构的 musl 二进制均为静态链接，ELF 没有 `DT_NEEDED` 共享库依赖，因此不声明额外运行库。`libarchive` 仅用于打包提取文件。保留上游二进制，禁用 strip 和 debug 拆包。

## 自动更新

[GitHub Actions](https://github.com/tinypkg/aur/actions/workflows/update-tgrep-bin.yml) 每 12 小时跟踪 GitHub 最新 Release，支持手动 `version` 和 `force`，拒绝降级。

发布前下载两种架构，检查文件结构、ELF 架构及静态链接，并运行 x86_64 二进制核对版本；ARM64 不在 x64 runner 上执行。若上游改为动态链接，workflow 会停止并要求复查依赖。

首次发布保留 `pkgrel=1`，已发布同版本强制更新递增 `pkgrel`。使用现有 `AUR_USERNAME`、`AUR_EMAIL`、`AUR_SSH_PRIVATE_KEY` Secrets，AUR 成功后才提交 GitHub 版本状态。

GitHub PKGBUILD 保留 `SKIP`，deploy action 的 `updpkgsums` 为许可证及两架构资产生成真实 SHA-256，并在 AUR 生成 `.SRCINFO`。
