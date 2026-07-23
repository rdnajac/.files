root := justfile_directory()
runner := "container"
image := "mcr.microsoft.com/vscode/devcontainers/base:ubuntu"

default:
    @just --list

act *ARGS:
    act push {{ARGS}}

test-act:
    act push --matrix os:ubuntu-latest -j install

test-ci image=image:
    set -euo pipefail
    set -x
    {{runner}} run --rm -v "{{root}}:/workspace" -w /workspace "{{image}}" \
      /bin/bash -lc './install.sh && "$HOME/.local/bin/chezmoi" data'
