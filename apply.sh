#!/bin/bash
set -e

AXION_ROOT="${1:-$HOME/axion}"
PATCH_ROOT="$(cd "$(dirname "$0")" && pwd)"

echo "Applying marble changes..."
git -C "$AXION_ROOT/device/xiaomi/marble" apply \
    "$PATCH_ROOT/marble/marble-axion-final.patch"

echo "Applying sm8450-common changes..."
git -C "$AXION_ROOT/device/xiaomi/sm8450-common" apply \
    "$PATCH_ROOT/sm8450-common/sm8450-common-axion-final.patch"

echo "Applying vendor sm8450-common changes..."
git -C "$AXION_ROOT/vendor/xiaomi/sm8450-common" apply \
    "$PATCH_ROOT/vendor-sm8450-common/vendor-sm8450-common-axion-final.patch"

echo "Applying SM8450 SELinux changes..."
git -C "$AXION_ROOT/device/qcom/sepolicy_vndr/sm8450" apply \
    "$PATCH_ROOT/qcom/sm8450-axkernel-selinux.patch"

echo "All Karan Axion patches applied successfully."
