#!/usr/bin/env bash
set -euo pipefail
set -x

ROOT="$(cd "$(dirname "$0")" && pwd)"
IMAGE="mcr.microsoft.com/vscode/devcontainers/base:ubuntu"

container run --rm -it -v "${ROOT}:/workspace" -w /workspace "${IMAGE}" \
  /bin/bash -lc "./install.sh && /root/.local/bin/chezmoi data"
