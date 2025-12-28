#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

if ! command -v swift >/dev/null 2>&1; then
  echo "swift not found; install Swift to run tests."
  exit 0
fi

if [ ! -f "Package.swift" ]; then
  echo "No Swift Package manifest found. Add Package.swift to enable 'swift test'."
  exit 0
fi

echo "Running lightweight XCTest stubs..."
swift test
