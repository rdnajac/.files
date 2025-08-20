#!/usr/bin/env bash
## test script
CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BIN_DIR="${CURRENT_DIR}/.."
LIB_DIR="${CURRENT_DIR}/../lib"

. "${LIB_DIR}/common.sh"

info "Running tests..."
info "----------------"
info "BIN_DIR=${BIN_DIR}"
info "LIB_DIR=${LIB_DIR}"
yay
