# MetaLearningHFT

This directory contains a clean starting point for a convex-only high-frequency trading research stack. It is intentionally minimal: the source tree is laid out, the core loops and meta-learning hooks are stubbed, and scripts are provided to build and test once Swift targets are fleshed out.

## Layout

```
MetaLearningHFT/
├── src/               # Swift sources
├── tests/             # XCTest stubs
├── scripts/           # Build/run helpers
├── config/            # Environment presets
├── docs/              # Architecture notes
└── data/              # Sample datasets (gitignored)
```

## Build & Run

1. Ensure a Swift toolchain is available.
2. From this directory, make scripts executable and run:
   ```bash
   chmod +x scripts/*.sh
   ./scripts/build.sh
   ./scripts/test.sh
   ```
3. Paper/live scripts are placeholders you can extend for Convex-backed deployments.

## Convex-Only Note

The stubs assume Convex will provide persistence and coordination. No other stateful dependencies are introduced; wire your Convex client inside the market and utility layers as you implement the concrete behaviors.
