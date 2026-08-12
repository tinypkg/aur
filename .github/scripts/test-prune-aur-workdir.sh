#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
PRUNE_SCRIPT="${SCRIPT_DIR}/prune-aur-workdir.sh"

workdir=$(mktemp -d)
cleanup() {
  rm -rf -- "${workdir}"
}
trap cleanup EXIT

touch "${workdir}/PKGBUILD"
touch "${workdir}/.SRCINFO"
touch "${workdir}/opencli-rs-bin.install"
touch "${workdir}/fix.patch"
touch "${workdir}/service.conf"
touch "${workdir}/daemon.service"
touch "${workdir}/app.desktop"
touch "${workdir}/launcher.sh"
touch "${workdir}/opencli-rs-bin-0.2.3-x86_64.tar.gz"
touch "${workdir}/opencli-rs"
mkdir -p "${workdir}/src" "${workdir}/pkg" "${workdir}/.git"
touch "${workdir}/src/source.tmp" "${workdir}/pkg/package.tmp"

bash "${PRUNE_SCRIPT}" "${workdir}" launcher.sh

test -f "${workdir}/PKGBUILD"
test -f "${workdir}/.SRCINFO"
test -f "${workdir}/opencli-rs-bin.install"
test -f "${workdir}/fix.patch"
test -f "${workdir}/service.conf"
test -f "${workdir}/daemon.service"
test -f "${workdir}/app.desktop"
test -f "${workdir}/launcher.sh"
test -d "${workdir}/.git"

test ! -e "${workdir}/opencli-rs-bin-0.2.3-x86_64.tar.gz"
test ! -e "${workdir}/opencli-rs"
test ! -e "${workdir}/src"
test ! -e "${workdir}/pkg"
