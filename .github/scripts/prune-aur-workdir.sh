#!/usr/bin/env bash

set -euo pipefail

workdir=${1:-.}
shift || true

if [[ ! -d "${workdir}" ]]; then
  echo "workdir does not exist: ${workdir}" >&2
  exit 1
fi

shopt -s dotglob nullglob

for path in "${workdir}"/*; do
  name=$(basename -- "${path}")

  case "${name}" in
    .|..|.git|PKGBUILD|.SRCINFO|*.install|*.patch|*.conf|*.service|*.desktop)
      continue
      ;;
  esac

  for asset in "$@"; do
    if [[ "${name}" == "${asset}" ]]; then
      continue 2
    fi
  done

  rm -rf -- "${path}"
done
