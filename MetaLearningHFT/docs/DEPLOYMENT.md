# Deployment

1. Provision Convex for state and coordination.
2. Build artifacts with `scripts/build.sh` and publish the resulting binary.
3. Configure environment via `config/production.json`.
4. Connect to market data/execution endpoints in the `market` layer before running `scripts/run-live.sh`.
