# 2026-08-22 17:04 — Remove deprecated Lilac and Memof runtime dependencies

- Replaced Phlox's internal Lilac validation schemas with neutral compatibility values and made the development checks no-op, so consumers no longer need to load the deprecated `lilac` module.
- Replaced the remaining Memof cache call with direct computation and made cache clearing a safe no-op.
- Removed both dependencies and their Snapshot module entries, then verified the native check-only path and JavaScript code generation with Calcit 0.13.29.
