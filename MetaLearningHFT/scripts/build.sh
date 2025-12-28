#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."
mkdir -p .build

if ! command -v swiftc >/dev/null 2>&1; then
  echo "swiftc not found; install a Swift toolchain to build."
  exit 0
fi

echo "Building MetaLearningHFT sources..."
swiftc -emit-library -emit-module -module-name MetaLearningHFT -o .build/libMetaLearningHFT.so $(find src -name '*.swift')
echo "Build artifacts written to .build/libMetaLearningHFT.so"
