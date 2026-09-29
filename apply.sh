#!/bin/bash
set -e

AXION_ROOT="${1:-$HOME/axion}"
PATCH_ROOT="$(cd "$(dirname "$0")" && pwd)"

git -C "$AXION_ROOT/device/xiaomi/marble" apply \
    "$PATCH_ROOT/marble/marble-axion-final.patch"

git -C "$AXION_ROOT/device/xiaomi/sm8450-common" apply \
    "$PATCH_ROOT/sm8450-common/sm8450-common-axion-final.patch"

git -C "$AXION_ROOT/device/qcom" apply \
    "$PATCH_ROOT/qcom/sm8450-axkernel-selinux.patch"

echo "All Karan Axion patches applied successfully."
