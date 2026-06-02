root := justfile_directory()
image := "mcr.microsoft.com/vscode/devcontainers/base:ubuntu"

test-ci:
    set -euo pipefail
    set -x
    container run --rm -it -v "{{root}}:/workspace" -w /workspace "{{image}}" \
      /bin/bash -lc "./install.sh && /root/.local/bin/chezmoi data"