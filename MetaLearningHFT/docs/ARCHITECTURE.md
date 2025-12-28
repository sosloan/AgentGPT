# Architecture

This document outlines the intended components for MetaLearningHFT. The core loop (`TrickExecutive`) runs at 100Hz, dispatching to 36 specialized heads coordinated by `GoatAttention`. The meta layer uses `StrangeLoopOracle` to update market regimes and influence head behavior. Persistence and coordination are expected to be provided via Convex.
